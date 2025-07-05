speed = 2
function onCreatePost()
   jodidopath = "SMLDoorStuffs/"


makeAnimatedLuaSprite('momento peak', jodidopath..'/evilBG',-1500,-850)
addAnimationByPrefix('momento peak', 'idle', 'evil', 24, true)
scaleObject('momento peak', 5,5)
 setScrollFactor("momento peak",0,0)

    CreateLuaSprite("door1",jodidopath.."door1",-725,175,3.2,3.2,false,"camGame",1,1,true,1)
    CreateLuaSprite("door2",jodidopath.."door2",-725,175,3.2,3.2,false,"camGame",1,1,false,0.5)
    CreateLuaSprite("door oscuridad",jodidopath.."oscuridad",-650,175,3.2,3.2,true,"camGame",1,1,true,1)
    CreateLuaSprite("bulbshit",jodidopath.."luz xdddd",-650,175,3.2,3.2,true,"camGame",1,1,true,1)
     CreateLuaSprite("bars","bars",0,0,2.03,2.03,false,"camHUD",1,1,true,1)
     CreateLuaSprite("stuffs",jodidopath.."frente",-500,175,3.2,3.2,true,"camGame",1.1,0.8,true,1)
      CreateLuaSprite("stuffs2",jodidopath.."frente2",-500,175,3.2,3.2,true,"camGame",1.1,0.8,false,1)
    CreateLuaSprite("oscuridad full",jodidopath.."real dark",-50,175,3750,1700,true,"camGame",1,1,false,0.95)

 setBlendMode('bulbshit','add')

      doTweenAngle('rightangle','bulbshit',4,speed,'sineInOut')
      doTweenX('right','bulbshit',getProperty('bulbshit.x')-150,speed,'sineInOut')
      doTweenAngle('rightangle2',"door oscuridad",4,speed,'sineInOut')
      doTweenX('right2','door oscuridad',getProperty('bulbshit.x')-150,speed,'sineInOut')  
	  colorstuff(0,0.0001)
end
function onTweenCompleted(tag)
   if tag == 'rightangle' then
      doTweenAngle('leftangle','bulbshit',-5,speed,'sineInOut')
      doTweenX('left','bulbshit',getProperty('bulbshit.x')+170,speed,'sineInOut')
      doTweenAngle('left2',"door oscuridad",-5,speed,'sineInOut')
      doTweenX('left2','door oscuridad',getProperty('bulbshit.x')+170,speed,'sineInOut')
   elseif tag == 'leftangle' then
      doTweenAngle('rightangle','bulbshit',5,speed,'sineInOut')
      doTweenX('right','bulbshit',getProperty('bulbshit.x')-170,speed,'sineInOut')
      doTweenAngle('rightangle2',"door oscuridad",5,speed,'sineInOut')
      doTweenX('right2','door oscuridad',getProperty('bulbshit.x')-170,speed,'sineInOut')
   end
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
function onEvent(name,value1,value2)
         if name == 'luz' then
            runTimer('lmfao',0.1)
            runTimer('stop',1)
            for _, matame in pairs({"bulbshit","door oscuridad"}) do
            setProperty(matame..'.visible', false)
            setProperty('oscuridad full.visible', true)
            end
         end
end
function onStepHit()
if curStep == 575 then
colorstuff(1,1)
elseif curStep == 831 then
colorstuff(0,1)
elseif curStep == 1086 then
colorstuff(1,0.2)
elseif curStep == 1343 then
colorstuff(0,1)
elseif curStep == 1889 then
colorstuff(1,1)
elseif curStep == 2147 then
colorstuff(0,1)
elseif curStep == 2500 then
colorstuff(1,1)
elseif curStep == 3808 then
colorstuff(0,1)
for _, e in pairs({"door1","stuffs"}) do
setProperty(e..".visible",true)
end
endings(getRandomInt(1,3))
setProperty('cameraSpeed', 1)
setProperty('camGame.bgColor', getColorFromHex('000000'))
removeLuaSprite("stuffs2")
removeLuaSprite("door2")
elseif curStep == 3041 then
addLuaSprite('momento peak')
setProperty('camGame.bgColor', getColorFromHex('A60000'))
for _, e in pairs({"door1","stuffs","bulbshit","door oscuridad","gf"}) do
setProperty(e..".visible",false)
end
elseif curStep == 3296 then
removeLuaSprite('momento peak')
setProperty('cameraSpeed', 2.5)
for _, e in pairs({"door2","stuffs2","bulbshit","door oscuridad","gf"}) do
setProperty(e..".visible",true)
end
elseif curStep == 4066 then
setProperty("camGame.alpha",0)
setProperty("camHUD.alpha",0)
doTweenAlpha("SEXGAY","gay",1,2)
end
end
function onTimerCompleted(tag)
     if tag == 'lmfao' then
     for _, matame in pairs({"bulbshit","door oscuridad"}) do
     setProperty(matame..'.visible', true)
     setProperty('oscuridad full.visible', false)
     end
     runTimer('loop',0.1)
     elseif tag == 'loop' then
     for _, matame in pairs({"bulbshit","door oscuridad"}) do
     setProperty(matame..'.visible', false)
     setProperty('oscuridad full.visible', true)
     end
     runTimer('lmfao',0.2)
     elseif tag == 'stop' then
     for _, matame in pairs({"bulbshit","door oscuridad"}) do
     setProperty(matame..'.visible', true)
     setProperty('oscuridad full.visible', false)
     end
     cancelTimer('lmfao')
     cancelTimer('loop')
     end
end
function onDestroy()
setProperty('camGame.bgColor', getColorFromHex('000000'))
end
function colorstuff(color,speed)
if color == 1 then
              doTweenColor('2col22or',"bulbshit", 'F01A1E',speed)
              doTweenColor('c2olwo2r',"door oscuridad", "140000",speed)
              doTweenColor('colwo2wr',"stuffs", "210000",speed,'linear')         
end
if color == 0 then
              doTweenColor('col22or',"bulbshit", 'FF9000',speed,'linear')
              doTweenColor('colwo2r',"door oscuridad", "000000",speed,'linear')
	      doTweenColor('col2w2o2r',"stuffs", "121212",speed)
end
end
function endings(final)
if final == 1 then
    debugPrint("Bad Ending")
    cameraFlash('other',"000000",3)
    triggerEvent("Alt Idle Animation","bf","-alt")
    triggerEvent("Alt Idle Animation","GF","-alt")
end
if final == 2 then
debugPrint("SML Canon Ending")
end
if final == 3 then
     debugPrint("Old Man Yaoi Ending")
     CreateLuaSprite("gay",jodidopath.."gay",0,0,2.03,2.03,false,"other",1,1,true,0)
end
end