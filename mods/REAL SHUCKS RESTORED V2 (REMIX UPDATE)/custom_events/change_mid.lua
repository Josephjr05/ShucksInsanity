change = true
function onEvent(n)
  if n == 'change_mid' then
    if change then
    solo()
    change = false
    else
    normal()
    change = true
     end
  end
end
    


function solo()
middleScroll('true', 1, 1, "expoOut")
       for _, mrd in pairs({"dadGroup","boyfriend"}) do
       doTweenAlpha(mrd,mrd,0.0001,1,"expoOut")
       end
doTweenAlpha("dp","door1",0.3,1,"expoOut")
end

function normal()
middleScroll('false', 1, 1, "expoOut")
       for _, mrd in pairs({"boyfriend","dadGroup"}) do
       doTweenAlpha(mrd,mrd,1,1,"expoOut")
       end
doTweenAlpha("dp","door1",1,1,"expoOut")
end
function middleScroll(middle, timeBF, timeOpponent, ease)
    if not middlescroll then
        -- Middle
        local daXDiff = (middle:lower() == 'false' and 0 or 322)  
        for i = 0, 3 do
            noteTweenX('middleScrollTween_'..i, i, _G['defaultOpponentStrumX'..i] - (daXDiff * 2), timeOpponent, ease)
            noteTweenX('middleScrollTween_'..(i+4), i+4, _G['defaultPlayerStrumX'..i] - daXDiff, timeBF, ease)
        end
    end
end