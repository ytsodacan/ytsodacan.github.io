var lyric;
var fogGrp:Array<FlxSprite> = [];

function onCreatePost(){
    lyric = new FlxAnimate(1555 + 45, 1135 + -5, 'mods/silly/images/lyric');
    lyric.showPivot = false;
    lyric.anim.addBySymbol('story_of_yourtalebilly', 'story_of_yourtalebilly',0,0,24);
    lyric.antialiasing = true;
    lyric.visible = false;
   remove(lyric);
    insert(members.indexOf(game.getLuaObject("floor")) + 200, lyric);
}

function onMoveCamera(focus){
    //cam zoom when focus is dad or bf
    if(focus  == 'dad')
        game.defaultCamZoom = 0.625;
    else
        game.defaultCamZoom = 0.5;
}

function onEvent(eventName, value1, value2){
    //mid song events
    if (eventName == '') {
        if (value1 == 'hurt') {
            if (game.health > 0.5) {
                game.health -= 0.05;
            }
        }
    }
    if(eventName == "ill make"){
        switch(value1){
            case 'anim':
                lyric.visible = true;
                lyric.anim.play('story_of_yourtalebilly');
                game.dad.visible = false;
            case 'vid':
        lyric.visible = false;
        }
    }
}