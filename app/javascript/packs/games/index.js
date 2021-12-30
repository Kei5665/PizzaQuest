document.addEventListener('turbolinks:load', () => {

var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;

var phrases = [
  'あいうえお'
];

var phrasePara = document.querySelector('.phrase');
var resultPara = document.querySelector('.result');
var recognizedSentences = document.querySelector('.output');

var startBtn = document.querySelector('button');


function voiceInput() {
  startBtn.disabled = true;
  startBtn.textContent = '認識中';

  var phrase = phrases[0];
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
      resultPara.textContent = '想定内の答えです！';
      resultPara.style.background = 'lime';
    } else {
      resultPara.textContent = '想定外の答えです';
      resultPara.style.background = 'red';
    }

    console.log('信頼性' + event.results[0][0].confidence);
  }

  recognition.onspeechend = function() {
    recognition.stop();
    startBtn.disabled = false;
    startBtn.textContent = '次へ';
  }

  recognition.onerror = function(event) {
    startBtn.disabled = false;
    startBtn.textContent = 'やり直す';
    recognizedSentences.textContent = '入力時間オーバーなのでやり直してください';
  }
  
}

startBtn.addEventListener('click', voiceInput);

})