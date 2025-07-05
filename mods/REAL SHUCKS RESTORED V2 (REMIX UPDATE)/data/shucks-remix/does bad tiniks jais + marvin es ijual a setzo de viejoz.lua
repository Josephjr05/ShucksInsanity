function onCreatePost()
setProperty("camGame.alpha",0)
jodidopath = "SMLDoorStuffs/"
CreateLuaSprite("creditstuff1",jodidopath.."intro stuff",210,700,0.7,0.7,false,"camHUD",1,1,true,1)
CreateLuaSprite("creditstuff2",jodidopath.."maxwell",210,90,0.7,0.7,false,"camHUD",1,1,true,0)
end
function CreateLuaSprite(tag,path,X,Y,scaleX,scaleY,front,camera,scrollX,scrollY,visible,alpha)
    makeLuaSprite(tag,path,X,Y)
    setObjectCamera(tag,camera)
    addLuaSprite(tag,front)
    scaleObject(tag,scaleX,scaleY)
    setScrollFactor(tag,scrollX,scrollY)
    setProperty(tag..".alpha",alpha)
    setProperty(tag..".visible",visible)

end
function onSongStart()
doTweenAlpha("camGame","camGame",1,3,"expoOut")
doTweenY('aosk','creditstuff1',90,1,"expoOut")
runTimer('maxwellspawn',4)
end
function onTimerCompleted(tag)
if tag == 'maxwellspawn' then
doTweenAlpha("kmmelapela","creditstuff1",0,0.2)
doTweenAlpha("alksj","creditstuff2",1,0.5)
runTimer('km mata a maxwell',4)
end
if tag == 'km mata a maxwell' then
doTweenY('ao2sdsk','creditstuff2',700,1,"expoOut")
end
end
function onTweenCompleted(tag)
if tag == 'jdk' then
doTweenAlpha("camGame","camGame",1,3,"expoOut")
end
if tag == 'ao2sdsk' then
removeLuaSprite("creditstuff1")
removeLuaSprite("creditstuff2")
end
end
function onStepHit()
if curStep == 1732 then
setObjectCamera('dadGroup','camHUD')
 setProperty("dadGroup.x",900)
 setProperty("dadGroup.y",-50)
end 
if curStep == 1761 then
doTweenAlpha("dadG1roup","dad",0.3,1,"expoOut")
doTweenX('marvin pendejo','dadGroup',getProperty('dadGroup.x')-100,2,"expoOut")
end
if curStep == 1880 then
doTweenAlpha("dadG1roup","dad",0.0001,1,"expoOut")
end
if curStep == 1887 then
setObjectCamera('dadGroup','camGame')
 setProperty("dadGroup.x",1450)
 setProperty("dadGroup.y",870)
end
if curStep == 2245 then
doTweenAlpha("camGame","camGame",0,0.5,"expoOut")
end
if curStep == 2252 then
if not lowQuality then
makeVideoSprite("CUTSCENE_jeisucks", "cinematica",0,0, "camHUD", false)
end
if lowQuality then
    makeVideoSprite("CUTSCENE_jeisucks", "cinematica optimizada",320,195, "camHUD", false)
    scaleObject("CUTSCENE_jeisucks_video", 2, 2)
end 
setProperty("CUTSCENE_jeisucks_video.alpha",0)
doTweenAlpha("jk","CUTSCENE_jeisucks_video",1,1,"expoOut")
end
if curStep == 2258 then
UIvisible(false)
end
if curStep == 2515 then
UIvisible(true)
end
if curStep == 2530 then
doTweenAlpha("jdk","CUTSCENE_jeisucks_video",0,1,"expoOut")
end
end

function UIvisible(e)
if e == true then
setProperty('pointer.visible',true)
   for _, sans in pairs({"iconP1","iconP2","scoreTxt","timeTxt","timeBar","eee","healthBar"}) do
   doTweenAlpha(sans,sans,1,0.5)
   end
   for fadeP1 = 4,7 do
   noteTweenAlpha('playerStrums'..fadeP1, fadeP1, 1,0.5)
   end 
   for fadeP2 = 0,3 do
   noteTweenAlpha('opponentStrums'..fadeP2, fadeP2, 1,0.5)
   end
elseif e == false then
setProperty('pointer.visible',false)
 for _, sans in pairs({"iconP1","iconP2","scoreTxt","timeTxt","timeBar","eee","healthBar"}) do
   doTweenAlpha(sans,sans,0,0.5)
   end
   for fadeP1 = 4,7 do
   noteTweenAlpha('playerStrums'..fadeP1, fadeP1, 0,0.5)
   end 
   for fadeP2 = 0,3 do
   noteTweenAlpha('opponentStrums'..fadeP2, fadeP2, 0,0.5)
   end
end
end