document.addEventListener('turbolinks:load', () => {

  var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;

  // monsterコントローラーからのパラメータ
  var phrases = gon.names
  var user_attack_point = gon.user_attack_point

  // 「レシピを唱えろ!!」部分
  var encourageSpeech = document.querySelector('.encourage_to_speech');

  // 音声認識の結果を表示する要素
  var phrasePara = document.querySelector('.phrase');
  var resultPara = document.querySelector('.result');
  var recognizedSentences = document.querySelector('.output');
  var resultBox = document.querySelector('.speech-result-box');
    
  // 処理を実行するボタンとリンク
  var startBtn = document.querySelector('.start');
  var finishBtn = document.querySelector('.finish');
  var restartBtn = document.querySelector('#restart');
  var resultLink = document.querySelector('#result');
  
  // ライフゲージ
  const lifeBar_user = document.getElementById('life_user')
  const lifeBar_monster = document.getElementById('life_monster')
  // ライフゲージ初期値
  let life = 100
  let life_monster = 100

  // 次のレシピに進むためのカウント
  var count = 0
    
  function voiceInput() {
    
    //「レシピを唱えろ!!」部分を消して音声認識boxを表示
    resultBox.classList.remove("disable");
    encourageSpeech.classList.add("disable");
    startBtn.disabled = true;
    startBtn.textContent = '認識中';
    resultPara.textContent = '正誤判定中';
    resultPara.style.background = 'rgba(0,0,0,0.2)';
    recognizedSentences.textContent = '音声認識中';


    // レシピのカウント番目をphraseにする
    var phrase = phrases[count];
    phrasePara.textContent = phrase;
  
    // 音声認識おオブジェクト生成
    var recognition = new SpeechRecognition();
    recognition.lang = 'ja-JP';
    recognition.interimResults = false;
    recognition.maxAlternatives = 1;

    // 音声認識開始
    recognition.start();
  
    // 音声認識の結果出力処理
    recognition.onresult = function(event) {
    
      var speechResult = event.results[0][0].transcript;
      recognizedSentences.textContent = '「　' + speechResult + '　」' + 'という音声が認識されました';

      // レシピと入力された音声が同じかどうか判定
      if(speechResult === phrase) {
        // 正解の場合
        resultPara.textContent = '呪文を唱えた!!モンスターはダメージを受けた!!';
        resultPara.style.background = 'lime';
        alterLife_monster(user_attack_point);
        spel.play();
        damege.play();
        count++;

        // レシピが残っていたら次のレシピへ
        if (count < phrases.length) {
          startBtn.textContent = '次のターンへ';
        } else {
          // 残りのレシピがない場合はfinishBtnを出力
          resultPara.textContent = '呪文を唱えた!!モンスターはダメージを受けた!!';
          lifeBar_monster.value = 0;
          battle_music.pause()
          startBtn.classList.add("disable");
          finishBtn.classList.remove("disable");
          finishBtn.addEventListener('click', battleFinish);
        }
      } else {
          // 不正解の場合
          resultPara.textContent = '呪文が正しくありません';
          resultPara.style.background = 'red';
          startBtn.textContent = 'やり直す';
          uncorrect.play();
          alterLife( -25 )
      }
    }
    
    // 次のレシピの音声入力中もボタンはdisabled
    recognition.onspeechend = function() {
      recognition.stop();
      startBtn.disabled = false;
    }
  
    // もしも音声が認識できなかった場合
    recognition.onerror = function(event) {
      startBtn.disabled = false;
      startBtn.textContent = 'やり直す';
      recognizedSentences.textContent = '入力時間オーバーなのでやり直してください';
    }
  }

    // モンスターを倒した場合
    function battleFinish () {
        // 効果音
        clear.play();
        resultPara.textContent = 'モンスターを倒した!!';
        finishBtn.classList.add("disable");
        resultLink.classList.remove("disable");
    }

    // ゲームオーバになった場合
    function gameOver () {
        // 効果音
        gameover.play();
        resultPara.textContent = '目の前が真っ暗になった';
        restartBtn.textContent = '最初からやり直す';
        finishBtn.classList.add("disable");
        restartBtn.classList.remove("disable")
    }
    
    // ライフゲージ変更処理
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