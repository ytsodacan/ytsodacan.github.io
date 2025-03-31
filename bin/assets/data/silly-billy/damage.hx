function opponentNoteHit(note){
    if(game.health >= 0.1)
        game.health -= note.hitHealth * 0.5;
}