-- Joseph's Cool Script for Row mod

function precacheStage() 
precacheImage('bg');
    precacheImage('Imagen');
	precacheImage('Texto');
end

function onCreate()
    makeLuaSprite('bg', 'Sawbg', 290, 50); -- Rowan make sure you change the path to the image
    setLuaSpriteScrollFactor('bg', 1, 1);
	scaleObject('bg', 0.18, 0.18);
	setObjectCamera('bg', 'camHUD');
	setProperty('bg.alpha', 0);

    makeLuaSprite('Imagen', 'title', 350, 125); -- Rowan make sure you change the path to the image
    setLuaSpriteScrollFactor('Imagen', 1, 1);
	scaleObject('Imagen', 0.5, 0.5);
	setObjectCamera('Imagen', 'camHUD');
	setProperty('Imagen.alpha', 0);

	makeLuaSprite('Texto', 'title name', 500, 375); -- same here faggot, KILL YOURSELFR #LFFL F RLF L
	setLuaSpriteScrollFactor('Texto', 1, 1);
	scaleObject('Texto', 0.5, 0.5);
	setObjectCamera('Texto', 'camHUD');
	setProperty('Texto.alpha', 0);

    addLuaSprite('bg', false);    
    addLuaSprite('Imagen', false);
    addLuaSprite('Texto', false);
end

function onStepHit()
        if curStep == 768 then -- also step nigger, FUCK YOU
                doTweenAlpha('saw', 'bg', 1, 0.50);
		doTweenAlpha('Portada', 'Imagen', 1, 0.50);
		doTweenAlpha('Titulo', 'Texto', 1, 0.50);
	end

    if curStep == 811 then
                doTweenAlpha('saw', 'bg', 0, 0.50);
		doTweenAlpha('Portada', 'Imagen', 0, 0.50);
		doTweenAlpha('Titulo', 'Texto', 0, 0.50);
	end
end