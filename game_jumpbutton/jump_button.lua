jumpWindow = nil
jumpButton = nil
jumpMarquee = nil
upIncr = 0

function init()
  print("Test to see if init is called.")
  jumpWindow = g_ui.displayUI('jump_button')
  jumpMarquee = jumpWindow:getChildById('jumpmarquee')

  jumpWindow:hide()
  jumpButton = modules.client_topmenu.addLeftGameButton('game_jumpbutton', tr('Jump Log'), '/images/topbuttons/hotkeys', toggle, false, 8)

end

function terminate()
  jumpWindow:destroy()
  jumpButton:destroy()
  stopEvent(eventId)
end

function toggle()
    if jumpWindow:isVisible() then
        jumpWindow:hide()
        jumpButton:setOn(false)
    else
        jumpWindow:show()
        jumpButton:setOn(true)
        jumpWindow:focus()
    end
end
function hide()
    jumpWindow:hide()
    jumpButton:setOn(false)
    stopEvent(eventId)
end

function slideButton()

    -- this moves button back to the starting pos but up 10 px/incrrements
    print("Button moved to the left", jumpMarquee:getMarginRight() - jumpMarquee:getX())
    incr = 10
    jumpMarquee:setMarginRight(jumpMarquee:getMarginRight() + incr)
    

    if jumpMarquee:getMarginRight() - jumpMarquee:getX() > 0  then
        jumpMarquee:setMarginRight(jumpMarquee: getWidth()/2)
        upIncr = math.random(10, 100)
        jumpMarquee: setMarginBottom(jumpMarquee: getMarginBottom() + upIncr)
        print('upIncr', upIncr)
        print('Height of button in window', jumpMarquee:getMarginBottom())
        if ( jumpMarquee:getMarginBottom()) > jumpWindow:getHeight() - jumpMarquee:getHeight()  then
            slideButtonUp()
        end
    end

end


function slideButtonUp()

    upIncr = math.random(10, 100)
    jumpMarquee: setMarginBottom(jumpMarquee: getMarginBottom() + upIncr)
    print('upIncr', upIncr)
    print('Height of button in window', jumpMarquee:getMarginBottom())
    if ( jumpMarquee:getMarginBottom()) > jumpWindow:getHeight() - jumpMarquee:getHeight()  then
        jumpMarquee:setMarginBottom(jumpMarquee:getHeight()/2)
    end

end