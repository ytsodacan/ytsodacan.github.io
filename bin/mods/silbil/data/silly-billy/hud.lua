local ii = 0

function onCreate()
	makeLuaSprite('healthfg', 'Bar/bar',432.5,619.5)
	setObjectCamera('healthfg', 'hud')
	scaleObject('healthfg',0.1,1)
	addLuaSprite('healthfg',false)

	makeLuaSprite('healthfg2', 'Bar/bar',73.5,619.5)
	setObjectCamera('healthfg2', 'hud')
	doTweenColor('healthshit','healthfg2','8A0101',1)
	scaleObject('healthfg2',0.1,1)
	addLuaSprite('healthfg2',false)

	makeLuaSprite('healthbg', 'Bar/Silly_Healthbar',0,480)
	setObjectCamera('healthbg', 'hud')
	scaleObject('healthbg',0.5,0.5)
	addLuaSprite('healthbg',false)

for i = 1,5 do
	makeAnimatedLuaSprite('sillyicon','icons/billyicon',300,550)
addAnimationByPrefix('sillyicon','anim1','billyicon 1',1)
objectPlayAnimation('sillyicon','anim1')
setObjectCamera('sillyicon','camHUD')
scaleObject('sillyicon',0.9,0.9)
addLuaSprite('sillyicon',true)
end
end

function onCreatePost()
setProperty('iconP1.flipX',true)
setProperty('healthfg2.flipX',true)
setProperty('scoreTxt.x',-250)
setProperty('scoreTxt.y',697.5)
end

function onUpdatePost()
setProperty('iconP2.y',550)
setProperty('iconP2.x',265)

setProperty('iconP1.x',400)
setProperty('iconP1.y',550)

setProperty('sillyicon.x',getProperty('iconP2.x'))
setProperty('sillyicon.y',getProperty('iconP2.y'))
setProperty('sillyicon.scale.x',getProperty('iconP2.scale.x')-0.1)
setProperty('sillyicon.scale.y',getProperty('iconP2.scale.y')-0.1)
if downscroll == true then
	setProperty('iconP1.y',0)
	setProperty('iconP2.y',0)
	setProperty('healthfg.y',59.5)
	setProperty('healthfg2.y',59.5)
	setProperty('healthbg.y',-80)
	setProperty('scoreTxt.y',117.5)
	setProperty('sillyicon.y',getProperty('iconP2.y'))
end

    local healthCopy = getProperty('health')

    local calculatedHealthSize = math.floor((315 * healthCopy/1.965))

	local calculatedHealthSize2 = math.floor((315 * healthCopy/1.965))

	if (calculatedHealthSize <= 1) then calculatedHealthSize = 1 end

    setGraphicSize('healthfg', calculatedHealthSize,30)

	if (calculatedHealthSize2 >= 319) then calculatedHealthSize2 = 319 end

	setGraphicSize('healthfg2',320-calculatedHealthSize2,30)

	
setProperty('iconP2.visible',false)
setProperty('healthBar.leftBar.visible',false)
setProperty('healthBar.rightBar.visible',false)
setProperty('healthBar.bg.visible',false)
end

function noteMiss()
ii = 0.175
setProperty('healthfg.x', (getProperty('healthfg.x')+ii))
end

function onStepHit()
if curStep == 1424 then
	addAnimationByPrefix('sillyicon','anim2','billyicon 2',1)
elseif curStep == 2048 then
	addAnimationByPrefix('sillyicon','anim3','billyicon 3',1)
elseif curStep == 2832 then
	addAnimationByPrefix('sillyicon','anim4','billyicon 4',1)
elseif curStep == 3328 then
	addAnimationByPrefix('sillyicon','anim5','billyicon 5',1)
elseif curStep == 3481 then
doTweenAlpha('blacshit','black',1,1.125,'quadOut')
elseif curStep == 3495 then
	doTweenAlpha('blacshit2','black',0,1)
	makeVideoSprite('myCutscene2', 'SO_STAY_FINAL',0,0, 'camHUD', false) -- tag, videoFile, x, y, camera, shouldLoop
	setObjectOrder('myCutscene2_video',getObjectOrder('bars')-1)
    setProperty('myCutscene2_video.alpha',1) -- The _video is **REQUIRED**
    setProperty('myCutscene2_video.antialiasing',false)
elseif curStep == 3621 and not middlescroll then
    for i = 4,7 do
        noteTweenAlpha("Notealpha2"..i.."",i,1,1.5,'quadOut')
            noteTweenX('playerTween'..i, i, (getProperty('playerStrums.members['..(i-4)..'].x')-325),1, 'quadOut')
			lyric = false
	end
	if curStep == 4175 then
		setProperty('camGame.alpha',0)
	    for i = 4,7 do
			noteTweenAlpha("Notealphaend"..i.."",i,0,1,'quadIn')
				end
    end
end
end