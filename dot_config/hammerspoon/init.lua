-- 自动检测屏幕变化并调整 Dock 行为
local function updateDockPosition()
    local screens = hs.screen.allScreens()
    local dockPos = "bottom"
    local autoHide = true
    local foundExternal = false

    -- 查找名为 "P5" 的外接屏
    for _, s in ipairs(screens) do
        if s:name() == "P5" then
            foundExternal = true
            break
        end
    end

    if foundExternal then
        -- 外接屏存在：Dock 左侧 + 不自动隐藏
        dockPos = "left"
        autoHide = false
    else
        -- 无外接屏：Dock 底部 + 自动隐藏
        dockPos = "bottom"
        autoHide = true
    end

    -- 设置 Dock 位置 & 自动隐藏
    local cmd = string.format(
        'defaults write com.apple.dock orientation %s; ' ..
        'defaults write com.apple.dock autohide -bool %s; ' ..
        'killall Dock',
        dockPos,
        autoHide and "true" or "false"
    )

    hs.execute(cmd)
end

-- 监听屏幕改变事件
local screenWatcher = hs.screen.watcher.new(updateDockPosition)
screenWatcher:start()

-- Hammerspoon 启动时执行一次
updateDockPosition()
