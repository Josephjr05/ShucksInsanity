function onCreatePost()
    makeLuaText('testo','TESTO', 1300, 10, 470)
    setTextSize('testo', 28)
    addLuaText('testo')
    setObjectCamera('testo', 'other')
    setTextAlignment('testo', 'center')
    setProperty('testo.alpha',0)
end
function onEvent(name,value1,value2)
 escribe = (value1)
 AE = tonumber(value2)
    if name == "lyrics text" then
          runTimer('bye',AE)
          setProperty('testo.alpha',1)
          setTextString('testo',''..escribe)
          --debugPrint("Testo")
    end
end
function onTimerCompleted(tag)
if tag == 'bye' then
doTweenAlpha("oe km mira que se va el testo","testo",0,1)
end
end
-- Bien vergas km