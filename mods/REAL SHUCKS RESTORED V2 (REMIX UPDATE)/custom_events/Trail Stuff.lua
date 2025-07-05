-- this is a modification i made for fun of a vs impostor v4 trail note script i made for fun
-- original script by CJRed#6258, modified by Kaite#1102

enabledDD = false
enabledBF = false
enabledGF = false
enabledMM = false

-- NOTHING BELOW SHOULD BE TOUCHED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- DON'T MODIFY ANYTHING HERE IF YOU DON'T KNOW WHAT YOU'RE DOING AND JUST USE THIS AS IT IS, THOUGH!!

function getIconColor(chr)
	return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1]+50,255), math.min(array[2]+50,255), math.min(array[3]+50,255))
end

local tags = {boyfriend = 'enabledBF', gf = 'enabledGF', dad = 'enabledDD', mom = 'enabledMM'}
function makeSmth(ea, ae, alph)
	if _G[tags[ea]] then
		local thing = 0
		thing = ae
		if not string.match(getProperty(ea..'.animation.curAnim.name'), 'sing') then
			thing = -1
		end
		for i = 1, 2 do
			ghostTrail(ea, {getProperty(ea..'.animation.frameName'), getProperty(ea..'.offset.x'), getProperty(ea..'.offset.y'), thing, getProperty(ea..'.animation.curFrame')}, alph)
			thing = -1
		end
	end
end

function onEvent(eventName, value1, value2)
	if eventName == 'Trail Stuff' then
		if string.find(value1, 'bf') then
			enabledBF = not enabledBF
		end
		if string.find(value1, 'dad') then
			enabledDD = not enabledDD
		end
		if string.find(value1, 'gf') then
			enabledGF = not enabledGF
		end
		if string.find(value1, 'mom') then
			enabledMM = not enabledMM
		end
	end
end

local chars = {boyfriend = -1, dad = -1}
local other = {gf = -1, mom = -1}

function goodNoteHit(id, direction, noteType, isSustainNote)
	chars['boyfriend'] = direction
	makeSmth('boyfriend', direction, 0.75)
end

function noteMiss(membersIndex, direction, noteType, isSustainNote)
	chars['boyfriend'] = direction
	makeSmth('boyfriend', direction, 0.75)
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if dadName ~= 'black' and noteType ~= 'Both Opponents Sing' then
		if getPropertyFromGroup('notes', id, 'gfNote') then
			other['gf'] = direction
			makeSmth('gf', direction, 0.75)
		elseif noteType ~= 'Opponent 2 Sing' then
			chars['dad'] = direction
			makeSmth('dad', direction, 0.75)
		else
			other['mom'] = direction
			makeSmth('mom', direction, 0.75)
		end
	end
end

local ghostNum = 0
local funniDis = 75
function ghostTrail(char, noteData, alph)
	-- debugPrint(char)
	local ghost = char..'Ghost'..ghostNum
	local group = char
	if char == 'mom' then
		group = 'dad'
	end

	makeAnimatedLuaSprite(ghost, getProperty(char..'.imageFile'), getProperty(char..'.x'), getProperty(char..'.y'))
	addAnimationByPrefix(ghost, 'idle', noteData[1], 0, false)
	setProperty(ghost..'.antialiasing', getProperty(char..'.antialiasing'))
	setProperty(ghost..'.offset.x', noteData[2])
	setProperty(ghost..'.offset.y', noteData[3])
	setProperty(ghost..'.scale.x', getProperty(char..'.scale.x'))
	setProperty(ghost..'.scale.y', getProperty(char..'.scale.y'))
	setProperty(ghost..'.flipX', getProperty(char..'.flipX'))
	setProperty(ghost..'.flipY', getProperty(char..'.flipY'))
	setProperty(ghost..'.visible', getProperty(char..'.visible'))
	setProperty(ghost..'.color', getIconColor(char))
	setProperty(ghost..'.alpha', 0.75 * getProperty(char..'.alpha') * alph)
	setBlendMode(ghost, 'hardlight')
	addLuaSprite(ghost)
	playAnim(ghost, 'idle', true, false, noteData[5])
	setObjectOrder(ghost, getObjectOrder(group..'Group') - 0.1)
	cancelTween(ghost)

	--if noteData[4] == 0 then
		--doTweenX(ghostNum..'', ghost, getProperty(char..'.x') - funniDis, crochet*0.001, 'sineout')
	--elseif noteData[4] == 1 then
		--doTweenY(ghostNum..'', ghost, getProperty(char..'.y') + funniDis, crochet*0.001, 'sineout')
	--elseif noteData[4] == 2 then
		--doTweenY(ghostNum..'', ghost, getProperty(char..'.y') - funniDis, crochet*0.001, 'sineout')
	--elseif noteData[4] == 3 then
		--doTweenX(ghostNum..'', ghost, getProperty(char..'.x') + funniDis, crochet*0.001, 'sineout')
	--else
		--doTweenX(ghostNum..'1', ghost..'.scale', getProperty(char..'.scale.x') + 0.15, crochet*0.001, 'sineout')
		--doTweenY(ghostNum..'2', ghost..'.scale', getProperty(char..'.scale.y') + 0.15, crochet*0.001, 'sineout')
	--end

	doTweenAlpha(ghost, ghost, 0, crochet*0.001, 'linear')

	ghostNum = ghostNum + 1
end

function onTweenCompleted(tag)
	if string.match(tag, 'Ghost') then
		removeLuaSprite(tag, true)
	end
end