function onCreate()
    setPropertyFromClass('backend.ClientPrefs', 'data.downScroll', false)   
    setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
    setProperty('skipArrowStartTween', true)
end
function onCreatePost()
UpdatePos = true
ae = false
    setObjectCamera('comboGroup','camGame')
    ComboStuff()
if not hideHud then
	makeLuaSprite('eee', 'IRIDA BAR RECREATION')
	setObjectCamera('eee', 'hud')
	addLuaSprite('eee', false)

        makeLuaSprite('pointer', 'pointer')
	setObjectCamera('pointer', 'hud')
	addLuaSprite('pointer', false)
        setProperty('pointer.origin.x', 50)
end


	setObjectOrder('eee', getObjectOrder('uiGroup') + 1)
        setObjectOrder('iconP1', getObjectOrder('uiGroup') + 3)
        setObjectOrder('iconP2', getObjectOrder('uiGroup') + 3)
        setObjectOrder('healthBar', getObjectOrder('uiGroup') + 3)
        setObjectOrder('pointer', getObjectOrder('uiGroup') + 4)
        screenCenter('eee', 'x')
        setProperty('healthBar.scale.x', 1.09)
        setProperty('scoreTxt.y', 20)

       for _, mrd in pairs({"iconP1","iconP2",'healthBar','eee',"pointer","scoreTxt","LifeTxt"}) do
       setProperty(mrd..".alpha",0)
       end

end
function onUpdatePost()
    doTweenX('pointer','pointer',287 + (1 - (getHealth() / 2)) * getProperty('healthBar.width'),0.0001)
    setProperty('iconP1.x', 970)
    setProperty('iconP2.x', 170)
	
if UpdatePos == true then
    setProperty('eee.y', getProperty('healthBar.y') - 120)
    setProperty('timeBar.y', getProperty('healthBar.y') + 40)
    setProperty('pointer.y', getProperty('healthBar.y') - 150)
    setProperty('timeTxt.y', getProperty('timeBar.y'))
    setProperty('iconP1.y', getProperty('healthBar.y') - 80)
    setProperty('iconP2.y', getProperty('healthBar.y') - 80)
end

if ae == true then
    if getProperty('health') > 1.97 then
       doTweenAlpha("mrd","pointer",0,0.2)
    elseif getProperty('health') > 0.4 then
       doTweenAlpha("mrd","pointer",1,0.2)
    end

end
end
function onSongStart()
       ae = true
	   UpdatePos = false
       for _, mrd in pairs({"iconP1","iconP2","healthBar","eee","pointer","scoreTxt","LifeTxt"}) do
       doTweenAlpha(mrd,mrd,1,0.5)
       end
end
function opponentNoteHit()
if getHealth() > 0.1 then
addHealth(-0.02)
end
end
function onEvent(n)
if n == 'Change Character' then

            ComboStuff()
end
  if n == 'barra' then
    if change then
    NormalBarra()
    change = false
    else
    AdiosBarra()
    change = true
     end
  end
end
function AdiosBarra()
UpdatePos = true
setProperty('comboGroup.visible',false)
setProperty('pointer.visible',false)
       for _, mrd in pairs({"iconP1","iconP2",'healthBar','eee',"timeBar","timeTxt"}) do
       doTweenAlpha(mrd,mrd,0,0.5)
       end
     doTweenY('healthBar','healthBar',getProperty('healthBar.x')+450,1,"expoOut")
end
function NormalBarra()
setProperty('comboGroup.visible',true)
setProperty('pointer.visible',true)
       for _, mrd in pairs({"iconP1","iconP2",'healthBar','eee',"timeBar","timeTxt"}) do
       doTweenAlpha(mrd,mrd,1,0.5)
       end
        doTweenY('healthBarr','healthBar',getProperty('healthBar.x')+300,1,"expoOut")
end
function onTweenCompleted(tag)
if tag == 'healthBarr' then
UpdatePos = false
end
end
function ComboStuff()
   setProperty('comboGroup.y',getProperty('boyfriend.y') - 100)
   setProperty('comboGroup.x',getProperty('boyfriend.x') - 100)
   setPropertyFromClass('ClientPrefs', 'comboOffset[0]', 0)
   setPropertyFromClass('ClientPrefs', 'comboOffset[1]', 0)
end
-- probablemente quien sea que vea esto y no sea en mi mod, definitivamente tomaron mi script, asi que dejo mi marca de aca aca. att: the maxwell cassidy/maxwell/nova65/mx_charter