document.addEventListener('turbolinks:load', () => {

  var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;

  var phrases = gon.names
  var user_attack_point = gon.user_attack_point
  var phrasePara = document.querySelector('.phrase');
  var resultPara = document.querySelector('.result');
  var recognizedSentences = document.querySelector('.output');
    
  var startBtn = document.querySelector('.start');
  var finishBtn = document.querySelector('.finish');
  var restartBtn = document.querySelector('#restart');
  var resultLink = document.querySelector('#result');
  var resultBox = document.querySelector('.speech-result-box');
  var encourageSpeech = document.querySelector('.encourage_to_speech');
  var count = 0
    
  const lifeBar_user = document.getElementById('life_user')         // ライフバー
  const lifeBar_monster = document.getElementById('life_monster')         // ライフバー
  const increaseBtn = document.getElementById('increase-btn') // + ボタン
  const decreaseBtn = document.getElementById('decrease-btn') // - ボタン
  let life = 100                                              // ライフ初期値
  let life_monster = 100                                              // ライフ初期値
    
  function voiceInput() {
    
    resultBox.classList.remove("disable");
    encourageSpeech.classList.add("disable");
    startBtn.disabled = true;
    startBtn.textContent = '認識中';
  
    var phrase = phrases[count];
    phrasePara.textContent = phrase;
    resultPara.textContent = '正誤判定中';
    resultPara.style.background = 'rgba(0,0,0,0.2)';
    recognizedSentences.textContent = '音声認識中';
  
    var recognition = new SpeechRecognition();
  
    recognition.lang = 'ja-JP';
  
    recognition.interimResults = false;
    recognition.maxAlternatives = 1;
  
    recognition.start();
  
    recognition.onresult = function(event) {
    
      var speechResult = event.results[0][0].transcript;
      recognizedSentences.textContent = '「　' + speechResult + '　」' + 'という音声が認識されました';
      if(speechResult === phrase) {
        resultPara.textContent = '呪文を唱えた!!モンスターはダメージを受けた!!';
        resultPara.style.background = 'lime';
        alterLife_monster(user_attack_point);
        spel.play();
        damege.play();
        count++;

        if (count < phrases.length) {
          startBtn.textContent = '次のターンへ';
        } else {
            //終了
          resultPara.textContent = '呪文を唱えた!!モンスターはダメージを受けた!!';
          lifeBar_monster.value = 0;
          battle_music.pause()
          startBtn.classList.add("disable");
          finishBtn.classList.remove("disable");
          finishBtn.addEventListener('click', battleFinish);
        }
  
      } else {
          resultPara.textContent = '呪文が正しくありません';
          resultPara.style.background = 'red';
          startBtn.textContent = 'やり直す';
          uncorrect.play();
          alterLife( -25 )
      }
    }
    
    recognition.onspeechend = function() {
      recognition.stop();
      startBtn.disabled = false;
    }
  
    recognition.onerror = function(event) {
      startBtn.disabled = false;
      startBtn.textContent = 'やり直す';
      recognizedSentences.textContent = '入力時間オーバーなのでやり直してください';
    }
      
  }
    
    function battleFinish () {
        // 効果音
        clear.play();
        resultPara.textContent = 'モンスターを倒した!!';
        finishBtn.classList.add("disable");
        resultLink.classList.remove("disable");
    }
    
    function gameOver () {
        // 効果音
        gameover.play();
        resultPara.textContent = '目の前が真っ暗になった';
        restartBtn.textContent = '最初からやり直す';
        finishBtn.classList.add("disable");
        restartBtn.classList.remove("disable")
    }
    
    // *** ライフ変更処理 ***
  function alterLife( value ){
    // lifeの値を算出する
    life += value 
    if ( life <= 0 ){
      // 算出の結果 0 以下になった場合
      life = 0
      // ゲームオーバの表示
      resultPara.textContent = '体力が0になった';
      resultPara.style.background = 'red';
      startBtn.classList.add("disable");
      finishBtn.classList.remove("disable");
      finishBtn.addEventListener('click', gameOver);
    } else {
      // 算出の結果 100 を超過した場合
      if ( life > 100 ) {
          life = 100
      }
      // 光部分を表示する
    }
    // ライフバーの値を更新する
    lifeBar_user.value = life
  }
    
  function alterLife_monster( value ){
    // lifeの値を算出する
    life_monster -= value 
    if ( life_monster <= 0 ){
      // 算出の結果 0 以下になった場合
      life_monster = 0      
    } else {
      // 算出の結果 100 を超過した場合
      if ( life_monster > 100 ) {
        life_monster = 100
      }
    }
    // ライフバーの値を更新する
    lifeBar_monster.value = life_monster
  }
  
  startBtn.addEventListener('click', voiceInput);   
})