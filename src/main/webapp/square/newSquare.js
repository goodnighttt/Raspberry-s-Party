//盒子弹入
//获取所有盒子
const boxes=document.getElementsByClassName('box');
//当盒子顶部运动到屏幕4/5，添加它的类名为show，放回原处
window.addEventListener('scroll',()=>{
	const triggleBotton=window.innerHeight*4/5;
	for (let i = 0; i < boxes.length; i++){
		const boxTop=boxes[i].getBoundingClientRect().top
		if(boxTop<triggleBotton){
			boxes[i].classList.add('show');
		}else{
			boxes[i].classList.remove('show');
		}
	}
})


window.onload = function(){
	//跳转页面
	const musicElement = document.getElementById('music');
	const studyElement = document.getElementById('study');
	const releaseElement = document.getElementById('release');

	studyElement.onclick=function toStudy(){
		  	 window.location.href = '../study/study.html';
	}
	musicElement.onclick=function toMusic(){
		  	 window.location.href = '../music/music.html';
	}
	releaseElement.onclick=function toRelease(){
		  	 window.location.href = '../release/release.html';
	}


}





