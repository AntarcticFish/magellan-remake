local Screen = require "widgets/screen" -- 引入"widgets/screen"模块
local Widget = require "widgets/widget"
local Image = require "widgets/image"
local Text = require "widgets/text"
local ImageButton = require "widgets/imagebutton"

local MglTerminalPanel = Class(Screen, function(self, owner)
    Screen._ctor(self, "mgl_terminal_panel")
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
    
    --------------------------内容--------------------------

    --三种功能图标在主显示区（APP图标大小都为80，间隔为40）
    --签到系统图标按钮（类似手机APP样式上图下字,上方留白120）
    self.sign_icon = self.root:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.sign_icon:SetScale(1.0, 1.0)  -- 使用SetScale而不是SetSize
    self.sign_icon:SetPosition(-280, 107.5)
    --下方添加字体
    self.sign_text = self.root:AddChild(Text(BODYTEXTFONT, 20))
    self.sign_text:SetString("签到系统")
    self.sign_text:SetColour(1, 1, 1, 1)
    self.sign_text:SetPosition(-280, 47.5)

    --科考任务图标按钮（类似手机APP样式上图下字）
    self.task_icon = self.root:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.task_icon:SetScale(1.0, 1.0)  -- 使用SetScale而不是SetSize
    self.task_icon:SetPosition(-160, 107.5)
    --下方添加字体
    self.task_text = self.root:AddChild(Text(BODYTEXTFONT, 20))
    self.task_text:SetString("科考任务")
    self.task_text:SetColour(1, 1, 1, 1)
    self.task_text:SetPosition(-160, 47.5)
    self.task_icon:SetOnClick(function()
        -- 延迟导入以避免循环依赖
        local MglResearchTaskPanel = require "screens/mgl_research_task_panel"
        local screen = TheFrontEnd:GetActiveScreen()
        if screen and screen.name == "mgl_terminal_panel" then
            screen:Close()
        end
        TheFrontEnd:PushScreen(MglResearchTaskPanel(self.owner))
    end)

    --科考购置图标按钮（类似手机APP样式上图下字）
    self.research_icon = self.root:AddChild(ImageButton("images/inventoryimages/mgl_skill1.xml", "mgl_skill1.tex"))
    self.research_icon:SetScale(1.0, 1.0)  -- 使用SetScale而不是SetSize
    self.research_icon:SetPosition(-40, 107.5)
    --下方添加字体
    self.research_text = self.root:AddChild(Text(BODYTEXTFONT, 20))
    self.research_text:SetString("科考购置")
    self.research_text:SetColour(1, 1, 1, 1)
    self.research_text:SetPosition(-40, 47.5)
    self.research_icon:SetOnClick(function()
        -- 延迟导入以避免循环依赖
        local MglResearchShopPanel = require "screens/mgl_research_shop_panel"
        local screen = TheFrontEnd:GetActiveScreen()
        if screen and screen.name == "mgl_terminal_panel" then
            screen:Close()
        end
        TheFrontEnd:PushScreen(MglResearchShopPanel(self.owner))
    end)

end)


function MglTerminalPanel:Close()
    TheFrontEnd:PopScreen(self)
end

return MglTerminalPanel