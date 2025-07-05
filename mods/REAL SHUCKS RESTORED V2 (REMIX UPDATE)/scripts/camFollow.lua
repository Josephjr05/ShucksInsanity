        
    canangle = false
        
    offset = 30
        
    eas = 'QuadOut'
        
    mult = 0.01
        
    ag = 1
        
    iiii = true
        
    notes = {'Hurt Note','note1','note2'}
        

function goodNoteHit(_, d, t,s)
    if iiii then
    follow(d,true,t)
    end
end
function opponentNoteHit(_, d, t,s)
    if iiii then
    follow(d,false,t)
    end
end

function noteMiss(_, _, t,s)
    if iiii then
    follow(nil,false,t)
    end
end


function follow(d,mt,t)
    for _, n in ipairs(notes) do
        if mustHitSection == mt and t ~= n then
            secs = mult *  getProperty('cameraSpeed') * getPropertyFromClass('flixel.FlxG', 'sound.music.pitch')
    
        if canangle then
            a = (d == 0 and -ag or d == 3 and ag)
            doTweenAngle('camGameAngle', 'camGame',a, secs+0.45, eas)
        end
    
            x = (d == 0 and -offset or d == 3 and offset)
            y = (d == 1 and offset or d == 2 and -offset)
            doTweenX('camX', 'camGame.targetOffset',x, secs, eas)
            doTweenY('camY', 'camGame.targetOffset',y, secs, eas)
        end
    end
end


function onUpdate()

    if target == 'bf' then
        cameraSetTarget('boyfriend')
    elseif target == 'dad' then
        cameraSetTarget('dad')
    end
    
    zeroBfOffX = getMidpointX('boyfriend')-100
    zeroBfOffY = getMidpointY('boyfriend')-100
    zeroDadOffX = getMidpointX('dad') +150
    zeroDadOffY = getMidpointY('dad') -100
    

    
    if mustHitSection == false then
        if getProperty('dad.animation.curAnim.name') == 'idle' then
            reseteo()
        end
        else
        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            reseteo()
        end
    end
    
end


    target = false
function onEvent(n,v1)
    if n == 'camera_target' then
        target = v1
        if v1 == 'gf' then
            triggerEvent('Camera Follow Pos',
                (zeroBfOffX<zeroDadOffX and zeroBfOffX or zeroDadOffX) + math.abs(zeroBfOffX - zeroDadOffX)/2,
                (zeroBfOffY<zeroDadOffY and zeroBfOffY or zeroDadOffY) + math.abs(zeroBfOffY - zeroDadOffY)/2 - 25
            )
        elseif v1 == '' then
            triggerEvent('Camera Follow Pos')
        end
    end
end

function reseteo()
    
    secs = mult *  getProperty('cameraSpeed') * getPropertyFromClass('flixel.FlxG', 'sound.music.pitch')
    
    if canangle then
    doTweenAngle('camGameAngle','camGame',0,secs+0.45,'linear')
    end
    
    doTweenX('camX', 'camGame.targetOffset',0, secs, eas)
    doTweenY('camY', 'camGame.targetOffset',0, secs, eas)
    
end

-- XD