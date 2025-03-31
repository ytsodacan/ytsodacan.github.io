local lyric = false

function onSongStart()
    makeVideoSprite('myCutscene', 'open',200,120, 'camOther', false) -- tag, videoFile, x, y, camera, shouldLoop
    setProperty('myCutscene_video.alpha',1) -- The _video is **REQUIRED**
    setProperty('myCutscene_video.antialiasing',false)
    scaleObject('myCutscene_video',1.5,1.5)
end

function onVideoFinished(tag)
if tag == 'myCutscene' then
doTweenAlpha('blackshit','camHUD',1,0.5,'quadOut')
cameraFlash('camGame', '000000', 0.25);
setProperty('defaultCamZoom',0.625)
elseif tag == 'myCutscene2' then
    setProperty('dad.visible',true)
    cameraFlash('camGame', '000000', 0.25);
    setProperty('camHUD.filtersEnabled',true)
    setProperty('camGame.filtersEnabled',true)
    for i = 4,7 and not middlescroll do
            noteTweenX('playerTweenw'..i, i, (getProperty('playerStrums.members['..(i-4)..'].x')+325),1, 'quadOut')
end
end
end

function onCreate()
    setProperty('camGame.filtersEnabled',false)
    setProperty('camHUD.filtersEnabled',false)
    setProperty('defaultCamZoom',1.125)
    setProperty('skipCountdown',true)
    setProperty('camHUD.alpha',0)

    makeLuaSprite('mirror','bg/silly_mirror',0,0)
    addLuaSprite('mirror',false)

    makeLuaSprite('mirror2','bg/broken_mirror',0,0)
    addLuaSprite('mirror2',false)
    setProperty('mirror2.visible',false)

    makeLuaSprite('black2', '', 0, 0)
    setScrollFactor('black2', 0, 0)
    makeGraphic('black2', 3840, 2160, 'FFFFFF')
    addLuaSprite('black2',false)
    setProperty('black2.alpha',0)
    setObjectCamera('black2','game')
    screenCenter('black2', 'xy')

    makeAnimatedLuaSprite('floor','bg/bgAssets',0,0)
    addAnimationByPrefix('floor','floorshit','Silly_floor',1,false)
    addLuaSprite('floor',false)

    makeAnimatedLuaSprite('pillar','bg/bgAssets',0,0)
    addAnimationByPrefix('pillar','idk','Silly_idk_1',1,false)
    addLuaSprite('pillar',false)

    makeAnimatedLuaSprite('pillar2','bg/bgAssets',0,0)
    addAnimationByPrefix('pillar2','idk2','Silly_idk_2',1,false)
    addLuaSprite('pillar2',false)

    makeLuaSprite('vig','vignette',0,0)
    setObjectCamera('vig','HUD')
    addLuaSprite('vig',false)

    makeLuaSprite('bars','bars',0,0)
    setObjectCamera('bars','HUD')
    addLuaSprite('bars',false)

    setObjectCamera('lyricexe', 'HUD')
    makeLuaText('lyricexe', '', screenWidth, 0, 665)
    setTextColor('lyricexe', '0xFFcfa92d')
    setTextFont('lyricexe', 'Times New Roman.ttf')
    setTextSize('lyricexe', 48)
    addLuaText('lyricexe')
    setObjectOrder("lyricsexe",20)

    makeLuaSprite('black', '', 0, 0)
setScrollFactor('black', 0, 0)
makeGraphic('black', 3840, 2160, '000000')
addLuaSprite('black',false)
setProperty('black.alpha',0)
setObjectCamera('black','other')
screenCenter('black', 'xy')
end

function onCreatePost()
if (shadersEnabled) then
        initLuaShader("blue");
        
        makeLuaSprite("temporaryShader");
        makeGraphic("temporaryShader", screenWidth, screenHeight);
        
        setSpriteShader("temporaryShader", "blue");

        addHaxeLibrary("ShaderFilter", "openfl.filters");
        addHaxeLibrary('ColorSwap', 'gameObjects.shader');
        runHaxeCode([[
            trace(ShaderFilter);
            game.camGame.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
            game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("temporaryShader").shader)]);
        ]]);
    end
end

function onUpdatePost(elapsed)
    setShaderFloat('temporaryShader','hue','1.3')
    setShaderFloat('temporaryShader','pix','0.00001')
if lyric == false then
setObjectOrder('floor',getObjectOrder('opponentStrums.members[1]')+23)
else
    setObjectOrder('floor',getObjectOrder('opponentStrums.members[1]')+21)
end
    setObjectOrder('pillar',getObjectOrder('floor')+2)
setObjectOrder('pillar2',getObjectOrder('floor')+1)
setObjectOrder('dadGroup',getObjectOrder('floor')+10)
setObjectOrder('boyfriendGroup',getObjectOrder('floor')+14)
    for i = 0, 3 do
        noteTweenAlpha("Notealpha"..i.."",i,0.5, 0.001)
        noteTweenX("NoteMove",0,795, 0.001)
        noteTweenX("NoteMovebb",1,1015, 0.001)
        noteTweenX("NoteMovebbb",2,1240, 0.001)
        noteTweenX("NoteMovebbbb",3,1450, 0.001)
    if downscroll == false then
        noteTweenY("NoteMoveb"..i.."",i,440, 0.001)
    else
        noteTweenY("NoteMoveb"..i.."",i,1180, 0.001)
    end
end
end

function onSpawnNote(id,direction,noteType,isSustainNote)
for i = 0,3 do
    if (not getPropertyFromGroup('unspawnNotes', i, 'mustPress')) and not isSustainNote then
      setPropertyFromGroup('unspawnNotes', i, 'multSpeed',1.25)
    elseif (getPropertyFromGroup('unspawnNotes', i+4, 'mustPress')) then
        setPropertyFromGroup('unspawnNotes', i+4, 'multSpeed',1)
    end
  end
end

function onEvent(name,v1,v2)
if name == 'ill make' and v1 == 'txt' then
setTextString('lyricexe',v2)
elseif name == 'ill make' and v1 == 'break mirror' and v2 == 'break mirror' then
setProperty('mirror2.visible',true)
playSound('mirror_break',1)
setProperty('black2.alpha',1)
doTweenAlpha('blackshit','black2',0,1)
triggerEvent('Screen Shake','0.25,0.01','0,0')
elseif name == 'ill make' and v1 == 'pre' then
for i = 4,7 do
    lyric = true
noteTweenAlpha("Notealpha"..i.."",i,0,1.5,'quadOut')
doTweenAlpha('iconP1DHSIT','iconP1',0,1.5,'quadOut')
doTweenAlpha('iconP1DHSIT2','sillyicon',0,1.5,'quadOut')
doTweenAlpha('iconP1DHSIT3','healthbg',0,1.5,'quadOut')
doTweenAlpha('iconP1DHSIT4','scoreTxt',0,1.5,'quadOut')
doTweenAlpha('iconP1DHSIT4.5','healthfg',0,1.5,'quadOut')
doTweenAlpha('iconP1DHSIT4.75','healthfg2',0,1.5,'quadOut')
doTweenAlpha('iconP1DHSIT5','timeTxt',0,1.5,'quadOut')
doTweenAlpha('iconP1DHSIT5.5','timeBar.bg',0,1.5,'quadOut')
doTweenAlpha('iconP1DHSIT6','timeBar.leftBar',0,1.5,'quadOut')
doTweenAlpha('iconP1DHSIT7','timeBar.rightBar',0,1.5,'quadOut')
end
if name == ',' and v1 == 'zoomin' then
setProperty('defaultCamZoom',getProperty('defaultCamZoom')+v2)
end
end
end