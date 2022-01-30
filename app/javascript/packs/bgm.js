document.addEventListener('turbolinks:load', () => {

  var battleStartBtn = document.querySelector('.battle-start');
  var bgmBtn = document.querySelector('#BGM');
    
  bgmBtn.addEventListener('click', startStop);
  function startStop() {
    if (battle_music.paused) {
      battle_music.play();
    } else {
      battle_music.pause();
    }
  }
    
})