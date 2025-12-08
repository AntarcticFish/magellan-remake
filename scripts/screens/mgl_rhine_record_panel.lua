local Widget = require "widgets/widget"
local Image = require "widgets/image"
local Text = require "widgets/text"
local ImageButton = require "widgets/imagebutton"
local Screen = require "widgets/screen" -- 引入Screen类
local TEMPLATES = require "widgets/redux/templates"

-- 导入歌单数据
local record_data = require "core_magellan_remake/data/mgl_rhine_record_data"

local MglRhineRecordPanel = Class(Screen, function(self, owner)
    Screen._ctor(self, "mgl_rhine_record_panel")
    self.owner = owner

    ---------------------------基本布局--------------------------
    --画一个背景
    self.root = self:AddChild(Widget("ROOT"))
    self.root:SetVAnchor(ANCHOR_MIDDLE)
    self.root:SetHAnchor(ANCHOR_MIDDLE)
    self.root:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self.root:SetMaxPropUpscale(MAX_HUD_SCALE)
    --添加一个背景
    self.bg = self.root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.bg:SetSize(900, 600)
    self.bg:SetPosition(0, 0)
    --实际屏幕
    self.screen = self.root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.screen:SetSize(780, 520)
    self.screen:SetPosition(0, 0)
    --上部状态条，位置为屏幕最上方
    self.top_bar = self.root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.top_bar:SetSize(780, 35)
    self.top_bar:SetPosition(0, 260 - 35/2)
    --右侧选项栏，位置为屏幕右侧
    self.right_bar = self.root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.right_bar:SetSize(220, 485)
    self.right_bar:SetPosition(390 - 220/2, -35/2)
    --中间剩余为主显示区
    self.main_display = self.root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.main_display:SetSize(560, 485)
    self.main_display:SetPosition(-110, -35/2)

    -- 添加一个按钮，用来显示关闭放于右上角
    self.exit_button = self.root:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.exit_button:SetPosition(470, 320)
    self.exit_button:SetScale(0.5, 0.5)
    self.exit_button:SetOnClick(function()
        self:Close()
    end)

    --------------------------界面标题--------------------------
    -- 设置界面标题
    self.title = self.root:AddChild(Text(NEWFONT, 48, "莱茵唱片"))
    self.title:SetColour(1, 0.9, 0.4, 1) -- 金色文字
    self.title:SetPosition(0, 260 - 35/2) -- 放在顶部状态条上

    -------------------------- 数据初始化--------------------------
    -- 初始化歌单数据
    self.all_songs = shallowcopy(record_data)
    self.current_song_index = 1
    self.current_song = self.all_songs[self.current_song_index]
    self.is_playing = false
    self.playback_position = 0
    self.volume = 1.0  -- 默认音量
    
    -- 播放模式：1=顺序播放，2=随机播放，3=顺序播放喜欢的，4=随机播放喜欢的
    self.playback_mode = 1
    self.playback_mode_names = {
        [1] = "顺序播放",
        [2] = "随机播放",
        [3] = "顺序播放喜欢的",
        [4] = "随机播放喜欢的"
    }
    
    --------------------------内容区域--------------------------
    -- 实现右侧选项栏歌单列表
    self:CreatePlaylistList()
    
    -- 添加返回终端按钮
    self:AddBackToTerminalButton()
    
    -- 实现左侧主显示区
    self:CreateMainDisplay()
    
    -- 恢复之前的播放状态（如果存在）
    -- 注意：必须在UI元素初始化后调用
    self:RestorePlaybackState()
    
end)

-- 恢复播放状态
function MglRhineRecordPanel:RestorePlaybackState()
    -- 检查owner中是否保存了播放状态
    if self.owner and self.owner.rhine_record_playback_state then
        local state = self.owner.rhine_record_playback_state
        
        -- 恢复播放状态
        self.is_playing = state.is_playing or false
        self.current_song_index = state.current_song_index or 1
        self.current_song = self.all_songs[self.current_song_index]
        self.playback_position = state.playback_position or 0
        self.volume = state.volume or 1.0
        self.playback_mode = state.playback_mode or 1
        
        -- 如果正在播放，需要重新同步播放进度更新和UI
        if self.is_playing then
            -- 停止后台播放监控任务
            if self.owner.rhine_record_background_task then
                self.owner.rhine_record_background_task:Cancel()
                self.owner.rhine_record_background_task = nil
            end
            
            -- 开始播放进度更新
            self:StartProgressUpdate()
            
            -- 更新歌曲信息显示
            self:UpdateSongInfo()
            
            -- 更新播放按钮文本
            if self.play_pause_button then
                self.play_pause_button:SetText("||")
            end
            
            -- 开始唱片旋转动画
            self:StartVinylRotation()
        end
        
        -- 更新播放模式按钮文本
            if self.mode_button then
                self.mode_button:SetText(self.playback_mode_names[self.playback_mode])
            end
        -- 更新音量显示
        self:UpdateVolumeDisplay()

    end
end

-- 创建歌单列表
function MglRhineRecordPanel:CreatePlaylistList()
    -- 清理之前的列表（如果存在）
    if self.playlist_container then
        self.playlist_container:Kill()
    end
    
    -- 创建歌单列表容器
    self.playlist_container = self.right_bar:AddChild(Widget("playlist_container"))
    
    -- 设置歌单列表参数
    local widget_width = 200
    local widget_height = 45
    local num_visible_rows = 8 -- 减少可见行数，为返回按钮留出空间
    
    -- 创建滚动列表
    self.playlist_list = self.playlist_container:AddChild(TEMPLATES.ScrollingGrid(
        self.all_songs,
        {
            context = {},
            widget_width = widget_width,
            widget_height = widget_height,
            num_visible_rows = num_visible_rows,
            num_columns = 1,
            item_ctor_fn = function(context, index)
                local root = Widget("song_item")
                
                -- 歌曲项背景
                root.bg = root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
                root.bg:SetSize(200, 45)
                root.bg:SetTint(0.2, 0.2, 0.2, 0.5)
                
                -- 歌曲标题
                root.title = root:AddChild(Text(NEWFONT, 22, "")) -- 增大字体大小
                root.title:SetColour(1, 1, 1, 1) -- 白色
                root.title:SetPosition(-40, 10, 0) -- 向右移动10个单位
                root.title:SetHAlign(ANCHOR_LEFT)
                root.title:SetRegionSize(120, 24) -- 增大显示区域以适应更大的字体
                
                -- 歌手名称
                root.artist = root:AddChild(Text(NEWFONT, 16, "")) -- 增大字体大小
                root.artist:SetColour(0.8, 0.8, 0.8, 1) -- 灰色
                root.artist:SetPosition(-40, -10, 0) -- 向右移动10个单位
                root.artist:SetHAlign(ANCHOR_LEFT)
                root.artist:SetRegionSize(120, 18) -- 增大显示区域以适应更大的字体
                
                -- 喜爱图标
                root.like_icon = root:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
                root.like_icon:SetSize(20, 20)
                root.like_icon:SetPosition(80, 0, 0)
                root.like_icon:SetTint(0.5, 0.5, 0.5, 1) -- 默认灰色
                
                return root
            end,
            apply_fn = function(context, widget, data, index)
                if not data then
                    widget:Hide()
                    return
                end
                
                widget:Show()
                widget.data = data
                widget.index = index
                
                -- 设置歌曲标题
                widget.title:SetString(data.title)
                
                -- 设置歌手名称
                widget.artist:SetString(data.artist)
                
                -- 更新喜爱图标
                if data.is_liked then
                    widget.like_icon:SetTint(1, 0, 0, 1) -- 红色表示喜欢
                else
                    widget.like_icon:SetTint(0.5, 0.5, 0.5, 1) -- 灰色表示不喜欢
                end
                
                -- 高亮显示当前选中的歌曲
                local panel = TheFrontEnd:GetActiveScreen()
                if panel and panel.current_song_index and index == panel.current_song_index then
                    -- 选中状态：蓝色背景，黄色文字
                    widget.bg:SetTint(0.2, 0.3, 0.5, 0.8) -- 深蓝色背景
                    widget.title:SetColour(1, 0.9, 0.4, 1) -- 黄色文字
                    widget.artist:SetColour(1, 1, 1, 1) -- 白色歌手名
                else
                    -- 未选中状态：默认灰色背景和文字
                    widget.bg:SetTint(0.2, 0.2, 0.2, 0.5) -- 灰色背景
                    widget.title:SetColour(1, 1, 1, 1) -- 白色文字
                    widget.artist:SetColour(0.8, 0.8, 0.8, 1) -- 灰色歌手名
                end
                
                -- 添加点击事件
                widget.OnMouseButton = function(self, button, down, x, y)
                    if button == MOUSEBUTTON_LEFT and not down then
                        -- 播放选中的歌曲
                        local panel = TheFrontEnd:GetActiveScreen()
                        if panel and panel.PlaySong then
                            panel.current_song_index = index
                            panel:PlaySong()
                            -- 更新选中状态
                            if panel.UpdatePlaylistSelection then
                                panel:UpdatePlaylistSelection()
                            end
                        end
                    end
                end
            end,
            scrollbar_offset = 7,
            scrollbar_height_offset = 0,
            peek_percent = 0.1,
            allow_bottom_empty_row = true,
            scrollbar_height = widget_height * num_visible_rows * 0.8
        }
    ))
    
    -- 设置容器位置 - 向上移动，为返回按钮留出空间
    self.playlist_container:SetPosition(0, 20)
end

-- 添加返回终端按钮
function MglRhineRecordPanel:AddBackToTerminalButton()
    self.back_button = self.right_bar:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.back_button:SetScale(1.4, 0.7) 
    self.back_button:SetPosition(0, -200)
    self.back_button:SetTextSize(20)
    self.back_button:SetText("返回终端")
    self.back_button.text:SetColour(1, 1, 1, 1)
    self.back_button:SetOnClick(function()
        self:Close()
        local MglTerminalPanel = require "screens/mgl_terminal_panel"
        TheFrontEnd:PushScreen(MglTerminalPanel(self.owner))
    end)
end

-- 设置音量
function MglRhineRecordPanel:SetVolume(volume)
    self.volume = volume
    
    -- 更新音量显示
    self:UpdateVolumeDisplay()
    
    -- 如果正在播放，更新当前播放的音量
    if self.is_playing and self.owner and self.owner.SoundEmitter then
        
        -- 先停止当前播放
        self.owner.SoundEmitter:KillSound("rhine_record_music")
        
        -- 以新音量重新播放
        if self.current_song and self.current_song.file_path then
            self.owner.SoundEmitter:PlaySound(self.current_song.file_path, "rhine_record_music", volume)
        end
        
        -- 恢复播放进度
        self.playback_position = 0
        
        -- 更新进度条显示
        self:UpdateProgress()
    end
end

-- 更新音量显示（显示百分比数字）
function MglRhineRecordPanel:UpdateVolumeDisplay()
    if self.volume_icon then
        -- 计算百分比值
        local volume_percent = math.floor(self.volume * 100)
        -- 设置音量百分比文本
        self.volume_icon:SetString(volume_percent .. "%")
        
        -- 根据音量大小设置颜色
        if self.volume <= 0 then
            self.volume_icon:SetColour(1, 0, 0, 1) -- 红色表示静音
        elseif self.volume <= 0.3 then
            self.volume_icon:SetColour(1, 1, 0, 1) -- 黄色表示低音量
        elseif self.volume <= 0.7 then
            self.volume_icon:SetColour(1, 1, 1, 1) -- 白色表示中音量
        else
            self.volume_icon:SetColour(0, 1, 0, 1) -- 绿色表示高音量
        end
    end
end

-- 创建左侧主显示区
function MglRhineRecordPanel:CreateMainDisplay()
    -- 主显示区分两部分：左侧唱片区，右侧信息和控制区
    
    -- 左侧唱片区
    self.vinyl_container = self.main_display:AddChild(Widget("vinyl_container"))
    self.vinyl_container:SetPosition(-150, 0, 0) -- 左移更多
    
    -- 唱片背景（圆形）
    self.vinyl_bg = self.vinyl_container:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.vinyl_bg:SetSize(200, 200) -- 放大唱片
    self.vinyl_bg:SetTint(0.1, 0.1, 0.1, 1) -- 黑色背景
    self.vinyl_bg:SetScale(1.0, 1.0, 1.0) -- 恢复正常比例
    
    -- 唱片表面
    self.vinyl = self.vinyl_container:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.vinyl:SetSize(170, 170) -- 放大唱片
    self.vinyl:SetTint(0.3, 0.3, 0.3, 1) -- 深灰色唱片
    self.vinyl:SetScale(1.0, 1.0, 1.0)
    
    -- 唱片中心装饰（圆形）
    self.vinyl_center = self.vinyl_container:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.vinyl_center:SetSize(30, 30) -- 保持大小
    self.vinyl_center:SetTint(1, 0.9, 0.4, 1) -- 金色中心
    self.vinyl_center:SetScale(1.0, 1.0, 1.0)
    
    -- 右侧信息和控制区
    self.info_container = self.main_display:AddChild(Widget("info_container"))
    self.info_container:SetPosition(120, 0, 0) -- 左移以保持平衡
    
    -- 歌曲标题
    self.song_title = self.info_container:AddChild(Text(NEWFONT, 40, ""))
    self.song_title:SetColour(1, 1, 1, 1) -- 白色
    self.song_title:SetPosition(0, 120, 0)
    self.song_title:SetHAlign(ANCHOR_MIDDLE)
    self.song_title:SetRegionSize(300, 50)
    
    -- 歌手名称
    self.song_artist = self.info_container:AddChild(Text(NEWFONT, 24, ""))
    self.song_artist:SetColour(0.8, 0.8, 0.8, 1) -- 灰色
    self.song_artist:SetPosition(0, 80, 0)
    self.song_artist:SetHAlign(ANCHOR_MIDDLE)
    self.song_artist:SetRegionSize(300, 30)
    
    -- 专辑名称
    self.song_album = self.info_container:AddChild(Text(NEWFONT, 20, ""))
    self.song_album:SetColour(0.6, 0.6, 0.6, 1) -- 深灰色
    self.song_album:SetPosition(0, 50, 0)
    self.song_album:SetHAlign(ANCHOR_MIDDLE)
    self.song_album:SetRegionSize(300, 25)
    
    -- 播放进度条背景
    self.progress_bg = self.info_container:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.progress_bg:SetSize(260, 10) -- 稍微缩短，避免贴边
    self.progress_bg:SetTint(0.3, 0.3, 0.3, 1)
    self.progress_bg:SetPosition(0, 0, 0)
    
    -- 播放进度条
    self.progress_bar = self.info_container:AddChild(Image("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.progress_bar:SetSize(0, 10)
    self.progress_bar:SetTint(1, 0.9, 0.4, 1) -- 金色进度
    self.progress_bar:SetPosition(-130, 0, 0) -- 调整起始位置
    
    -- 播放时间显示
    self.time_display = self.info_container:AddChild(Text(NEWFONT, 16, "0:00 / 0:00"))
    self.time_display:SetColour(0.8, 0.8, 0.8, 1) -- 灰色
    self.time_display:SetPosition(0, -25, 0)
    self.time_display:SetHAlign(ANCHOR_MIDDLE)
    
    -- 控制按钮容器
    self.controls_container = self.info_container:AddChild(Widget("controls_container"))
    self.controls_container:SetPosition(0, -70, 0)
    
    -- 播放模式按钮
    self.mode_button = self.controls_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.mode_button:SetScale(1.0, 0.5)
    self.mode_button:SetPosition(-100, 0, 0) -- 右移一些，避免贴边
    self.mode_button:SetTextSize(16)
    self.mode_button:SetText(self.playback_mode_names[self.playback_mode])
    self.mode_button.text:SetColour(1, 1, 1, 1)
    self.mode_button:SetOnClick(function()
        self:TogglePlaybackMode()
    end)
    
    -- 上一首按钮
    self.prev_button = self.controls_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.prev_button:SetScale(0.8, 0.8)
    self.prev_button:SetPosition(-60, 0, 0) -- 右移一些，避免贴边
    self.prev_button:SetTextSize(24)
    self.prev_button:SetText("<")
    self.prev_button.text:SetColour(1, 1, 1, 1)
    self.prev_button:SetOnClick(function()
        self:PreviousSong()
    end)
    
    -- 播放/暂停按钮
    self.play_pause_button = self.controls_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.play_pause_button:SetScale(1.2, 1.2)
    self.play_pause_button:SetPosition(-10, 0, 0) -- 右移一些，避免贴边
    self.play_pause_button:SetTextSize(32)
    self.play_pause_button:SetText("> ")
    self.play_pause_button.text:SetColour(1, 1, 1, 1)
    self.play_pause_button:SetOnClick(function()
        self:TogglePlayPause()
    end)
    
    -- 下一首按钮
    self.next_button = self.controls_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.next_button:SetScale(0.8, 0.8)
    self.next_button:SetPosition(40, 0, 0) -- 右移一些，避免贴边
    self.next_button:SetTextSize(24)
    self.next_button:SetText("> ")
    self.next_button.text:SetColour(1, 1, 1, 1)
    self.next_button:SetOnClick(function()
        self:NextSong()
    end)
    
    -- 喜欢按钮
    self.like_button = self.controls_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.like_button:SetScale(1.0, 0.5)
    self.like_button:SetPosition(90, 0, 0) -- 右移一些，避免贴边
    self.like_button:SetTextSize(16)
    self.like_button:SetText("❤")
    self.like_button.text:SetColour(0.5, 0.5, 0.5, 1) -- 默认灰色
    self.like_button:SetOnClick(function()
        self:ToggleLike()
    end)
    
    -- 音量控制容器 - 调整位置，使其在主显示区内
    self.volume_control_container = self.controls_container:AddChild(Widget("volume_control_container"))
    self.volume_control_container:SetPosition(120, 0, 0) -- 右移一些，避免贴边
    
    -- 音量百分比显示
    self.volume_icon = self.volume_control_container:AddChild(Text(NEWFONT, 24, "100%"))
    self.volume_icon:SetPosition(0, 0, 0)
    
    -- 音量增加按钮
    self.volume_up_button = self.volume_control_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.volume_up_button:SetScale(0.5, 0.5)
    self.volume_up_button:SetPosition(0, 25, 0)
    self.volume_up_button:SetTextSize(20)
    self.volume_up_button:SetText("↑")
    self.volume_up_button.text:SetColour(1, 1, 1, 1)
    self.volume_up_button:SetOnClick(function()
        -- 增加5%音量
        local new_volume = math.min(self.volume + 0.05, 1.0)
        self:SetVolume(new_volume)
    end)
    
    -- 音量减少按钮
    self.volume_down_button = self.volume_control_container:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.volume_down_button:SetScale(0.5, 0.5)
    self.volume_down_button:SetPosition(0, -25, 0)
    self.volume_down_button:SetTextSize(20)
    self.volume_down_button:SetText("↓")
    self.volume_down_button.text:SetColour(1, 1, 1, 1)
    self.volume_down_button:SetOnClick(function()
        -- 减少5%音量
        local new_volume = math.max(self.volume - 0.05, 0.0)
        self:SetVolume(new_volume)
    end)
    
    -- 初始化音量显示
    self:UpdateVolumeDisplay()
end

-- 更新歌曲信息显示
function MglRhineRecordPanel:UpdateSongInfo()
    -- 确保当前歌曲和UI元素都存在
    if not self.current_song or not self.song_title or not self.song_artist or not self.song_album or not self.like_button or not self.like_button.text then return end
    
    -- 更新歌曲标题（处理可能的nil标题）
    self.song_title:SetString(self.current_song.title or "")
    
    -- 更新歌手名称（处理可能的nil）
    self.song_artist:SetString(self.current_song.artist or "")
    
    -- 更新专辑名称（处理可能的nil）
    self.song_album:SetString(self.current_song.album or "")
    
    -- 更新喜欢按钮状态
    if self.current_song.is_liked then
        self.like_button.text:SetColour(1, 0, 0, 1) -- 红色表示喜欢
    else
        self.like_button.text:SetColour(0.5, 0.5, 0.5, 1) -- 灰色表示不喜欢
    end
    
    -- 更新进度条和时间显示
    self:UpdateProgress()
end

-- 更新播放进度
function MglRhineRecordPanel:UpdateProgress()
    if not self.current_song then return end
    
    local duration = self.current_song.duration
    local position = self.playback_position
    
    -- 计算进度百分比
    local progress_percent = (position / duration) * 100
    
    -- 更新进度条
    local bar_width = (progress_percent / 100) * 280
    self.progress_bar:SetSize(bar_width, 10)
    self.progress_bar:SetPosition(-140 + bar_width/2, 0, 0)
    
    -- 格式化时间显示
    local function format_time(seconds)
        local mins = math.floor(seconds / 60)
        local secs = math.floor(seconds % 60)
        return string.format("%d:%02d", mins, secs)
    end
    
    -- 更新时间显示
    self.time_display:SetString(format_time(position) .. " / " .. format_time(duration))
end

-- 更新歌单选中状态
function MglRhineRecordPanel:UpdatePlaylistSelection()
    if self.playlist_list then
        -- 刷新歌单列表以更新选中状态
        self.playlist_list:RefreshView()
    end
end

-- 播放歌曲
function MglRhineRecordPanel:PlaySong()
    self.current_song = self.all_songs[self.current_song_index]
    self.is_playing = true
    self.playback_position = 0
    
    -- 停止后台播放监控任务（如果存在）
    if self.owner and self.owner.rhine_record_background_task then
        self.owner.rhine_record_background_task:Cancel()
        self.owner.rhine_record_background_task = nil
    end
    
    -- 停止之前可能播放的音频
    if self.owner and self.owner.SoundEmitter then
        self.owner.SoundEmitter:KillSound("rhine_record_music")
    end
    
    -- 播放音频
    if self.current_song and self.current_song.file_path and self.owner and self.owner.SoundEmitter then
        -- 使用实体(owner)来播放音频，volume默认为1.0
        local volume = self.volume or 1.0
        self.owner.SoundEmitter:PlaySound(self.current_song.file_path, "rhine_record_music", volume)
    end
    
    -- 更新界面显示
    self:UpdateSongInfo()
    
    -- 更新播放按钮文本
    self.play_pause_button:SetText("||")
    
    -- 开始唱片旋转动画
    self:StartVinylRotation()
    
    -- 开始播放进度更新
    self:StartProgressUpdate()
    
    -- 更新歌单选中状态
    self:UpdatePlaylistSelection()
end

-- 暂停播放
function MglRhineRecordPanel:PauseSong()
    self.is_playing = false
    
    -- 停止后台播放监控任务（如果存在）
    if self.owner and self.owner.rhine_record_background_task then
        self.owner.rhine_record_background_task:Cancel()
        self.owner.rhine_record_background_task = nil
    end
    
    -- 停止播放音频
    if self.owner and self.owner.SoundEmitter then
        self.owner.SoundEmitter:KillSound("rhine_record_music")
    end
    
    -- 更新播放按钮文本
    self.play_pause_button:SetText(">|")
    
    -- 停止唱片旋转动画
    self:StopVinylRotation()
    
    -- 停止播放进度更新
    self:StopProgressUpdate()
end

-- 切换播放/暂停
function MglRhineRecordPanel:TogglePlayPause()
    if self.is_playing then
        self:PauseSong()
    else
        self:PlaySong()
    end
end

-- 下一首歌曲
function MglRhineRecordPanel:NextSong()
    -- 根据播放模式选择下一首歌曲
    if self.playback_mode == 1 then
        -- 顺序播放
        self.current_song_index = (self.current_song_index % #self.all_songs) + 1
    elseif self.playback_mode == 2 then
        -- 随机播放
        self.current_song_index = math.random(1, #self.all_songs)
    elseif self.playback_mode == 3 then
        -- 顺序播放喜欢的歌曲
        local liked_songs = {}
        for i, song in ipairs(self.all_songs) do
            if song.is_liked then
                table.insert(liked_songs, i)
            end
        end
        if #liked_songs > 0 then
            local current_pos = 1
            for i, idx in ipairs(liked_songs) do
                if idx == self.current_song_index then
                    current_pos = i
                    break
                end
            end
            self.current_song_index = liked_songs[(current_pos % #liked_songs) + 1]
        end
    elseif self.playback_mode == 4 then
        -- 随机播放喜欢的歌曲
        local liked_songs = {}
        for i, song in ipairs(self.all_songs) do
            if song.is_liked then
                table.insert(liked_songs, i)
            end
        end
        if #liked_songs > 0 then
            self.current_song_index = liked_songs[math.random(1, #liked_songs)]
        end
    end
    
    -- 播放新歌曲
    self:PlaySong()
end

-- 上一首歌曲
function MglRhineRecordPanel:PreviousSong()
    -- 根据播放模式选择上一首歌曲
    if self.playback_mode == 1 then
        -- 顺序播放
        self.current_song_index = (self.current_song_index - 2) % #self.all_songs + 1
    elseif self.playback_mode == 2 then
        -- 随机播放
        self.current_song_index = math.random(1, #self.all_songs)
    elseif self.playback_mode == 3 then
        -- 顺序播放喜欢的歌曲
        local liked_songs = {}
        for i, song in ipairs(self.all_songs) do
            if song.is_liked then
                table.insert(liked_songs, i)
            end
        end
        if #liked_songs > 0 then
            local current_pos = 1
            for i, idx in ipairs(liked_songs) do
                if idx == self.current_song_index then
                    current_pos = i
                    break
                end
            end
            self.current_song_index = liked_songs[(current_pos - 2) % #liked_songs + 1]
        end
    elseif self.playback_mode == 4 then
        -- 随机播放喜欢的歌曲
        local liked_songs = {}
        for i, song in ipairs(self.all_songs) do
            if song.is_liked then
                table.insert(liked_songs, i)
            end
        end
        if #liked_songs > 0 then
            self.current_song_index = liked_songs[math.random(1, #liked_songs)]
        end
    end
    
    -- 播放新歌曲
    self:PlaySong()
end

-- 切换播放模式
function MglRhineRecordPanel:TogglePlaybackMode()
    -- 循环切换播放模式
    self.playback_mode = self.playback_mode % 4 + 1
    
    -- 更新播放模式按钮文本
    self.mode_button:SetText(self.playback_mode_names[self.playback_mode])
end

-- 切换喜欢状态
function MglRhineRecordPanel:ToggleLike()
    if not self.current_song then return end
    
    -- 切换喜欢状态
    self.current_song.is_liked = not self.current_song.is_liked
    
    -- 更新喜欢按钮状态
    if self.current_song.is_liked then
        self.like_button.text:SetColour(1, 0, 0, 1) -- 红色表示喜欢
    else
        self.like_button.text:SetColour(0.5, 0.5, 0.5, 1) -- 灰色表示不喜欢
    end
    
    -- 更新歌单列表中的喜欢状态
    if self.playlist_list then
        self.playlist_list:RefreshView()
    end
end

-- 开始唱片旋转动画
function MglRhineRecordPanel:StartVinylRotation()
    -- 清除之前的动画
    if self.vinyl_rotation_task then
        self.vinyl_rotation_task:Cancel()
    end
    
    -- 开始旋转动画（每0.1秒旋转3度）
    self.vinyl_rotation = 0
    self.vinyl_rotation_task = self.inst:DoPeriodicTask(0.1, function()
        self.vinyl_rotation = (self.vinyl_rotation + 3) % 360
        self.vinyl:SetRotation(self.vinyl_rotation)
    end)
end

-- 停止唱片旋转动画
function MglRhineRecordPanel:StopVinylRotation()
    if self.vinyl_rotation_task then
        self.vinyl_rotation_task:Cancel()
        self.vinyl_rotation_task = nil
    end
end

-- 开始播放进度更新
function MglRhineRecordPanel:StartProgressUpdate()
    -- 清除之前的进度更新任务
    if self.progress_update_task then
        self.progress_update_task:Cancel()
    end
    
    -- 开始进度更新（每秒更新一次）
    self.progress_update_task = self.inst:DoPeriodicTask(1, function()
        if self.is_playing then
            self.playback_position = self.playback_position + 1
            
            -- 检查是否播放完毕
            if self.playback_position >= self.current_song.duration then
                self:NextSong()
            else
                self:UpdateProgress()
            end
        end
    end)
end

-- 停止播放进度更新
function MglRhineRecordPanel:StopProgressUpdate()
    if self.progress_update_task then
        self.progress_update_task:Cancel()
        self.progress_update_task = nil
    end
end

-- 关闭面板
function MglRhineRecordPanel:Close()
    -- 保留音乐播放，实现随身听功能
    -- 注意：不停止音频播放，只停止UI相关的任务
    
    -- 停止所有动画和任务（只影响UI，不影响音乐播放）
    self:StopVinylRotation()
    self:StopProgressUpdate()
    
    -- 保存播放状态到owner中，以便下次打开面板时恢复
    if self.owner then
        self.owner.rhine_record_playback_state = {
            is_playing = self.is_playing,
            current_song_index = self.current_song_index,
            playback_position = self.playback_position,
            volume = self.volume,
            playback_mode = self.playback_mode,
            -- 保存歌单数据引用
            all_songs = self.all_songs
        }
        
        -- 如果正在播放，设置一个周期性任务在owner上继续监控播放进度
        if self.is_playing then
            -- 先取消可能存在的旧任务
            if self.owner.rhine_record_background_task then
                self.owner.rhine_record_background_task:Cancel()
            end
            
            -- 创建后台播放监控任务
            self.owner.rhine_record_background_task = self.owner:DoPeriodicTask(1, function(inst)
                -- 获取保存的播放状态
                local state = inst.rhine_record_playback_state
                if state and state.is_playing and state.current_song_index and state.all_songs and state.all_songs[state.current_song_index] then
                    -- 更新播放位置
                    state.playback_position = state.playback_position + 1
                    
                    -- 获取当前歌曲信息
                    local current_song = state.all_songs[state.current_song_index]
                    
                    -- 检查是否播放完毕
                    if current_song and state.playback_position >= current_song.duration then
                        -- 根据播放模式选择下一首歌曲
                        local next_song_index
                        if state.playback_mode == 1 then
                            -- 顺序播放
                            next_song_index = (state.current_song_index % #state.all_songs) + 1
                        elseif state.playback_mode == 2 then
                            -- 随机播放
                            next_song_index = math.random(1, #state.all_songs)
                        elseif state.playback_mode == 3 then
                            -- 顺序播放喜欢的歌曲
                            local liked_songs = {}
                            for i, song in ipairs(state.all_songs) do
                                if song.is_liked then
                                    table.insert(liked_songs, i)
                                end
                            end
                            if #liked_songs > 0 then
                                local current_pos = 1
                                for i, idx in ipairs(liked_songs) do
                                    if idx == state.current_song_index then
                                        current_pos = i
                                        break
                                    end
                                end
                                next_song_index = liked_songs[(current_pos % #liked_songs) + 1]
                            else
                                -- 如果没有喜欢的歌曲，回退到顺序播放
                                next_song_index = (state.current_song_index % #state.all_songs) + 1
                            end
                        elseif state.playback_mode == 4 then
                            -- 随机播放喜欢的歌曲
                            local liked_songs = {}
                            for i, song in ipairs(state.all_songs) do
                                if song.is_liked then
                                    table.insert(liked_songs, i)
                                end
                            end
                            if #liked_songs > 0 then
                                next_song_index = liked_songs[math.random(1, #liked_songs)]
                            else
                                -- 如果没有喜欢的歌曲，回退到随机播放
                                next_song_index = math.random(1, #state.all_songs)
                            end
                        end
                        
                        -- 更新当前歌曲索引
                        if next_song_index then
                            state.current_song_index = next_song_index
                            state.playback_position = 0
                            
                            -- 播放新歌曲
                            local next_song = state.all_songs[next_song_index]
                            if next_song and next_song.file_path and inst.SoundEmitter then
                                -- 停止当前播放
                                inst.SoundEmitter:KillSound("rhine_record_music")
                                -- 播放新歌曲
                                inst.SoundEmitter:PlaySound(next_song.file_path, "rhine_record_music", state.volume or 1.0)
                            end
                        end
                    end
                end
            end)
        end
    end
    
    -- 关闭当前屏幕
    TheFrontEnd:PopScreen(self)
end

-- 初始化函数
function MglRhineRecordPanel:OnShow()
    -- 调用父类的OnShow
    Screen.OnShow(self)
end

-- 清理函数
function MglRhineRecordPanel:OnHide()
    -- 停止播放音频
    if self.owner and self.owner.SoundEmitter then
        self.owner.SoundEmitter:KillSound("rhine_record_music")
    end
    
    -- 停止所有动画和任务
    self:StopVinylRotation()
    self:StopProgressUpdate()
    
    -- 调用父类的OnHide
    Screen.OnHide(self)
end

return MglRhineRecordPanel