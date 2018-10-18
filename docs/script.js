let selected = null;
let url = null;

function unselect(){
	let div = document.getElementById(selected);
	let img = div.firstChild.nextSibling;
	let big = img.nextElementSibling;
	if(div) {
		div.classList.remove('focus');
		img.classList.remove('hidden');
		big.classList.add('hidden');}
	selected = null;
	url = null;
};

function select(tag){
	let old = selected;
	if (selected) { unselect() };
	if (old !== tag) {
		let id = selected + '-img';
		let div = document.getElementById(tag);
		let img = div.firstChild.nextSibling;
		let big = img.nextElementSibling;
		if(div) {
			div.classList.add('focus');
			img.classList.add('hidden');
			big.classList.remove('hidden');}

		selected = tag;
	}
};

function init() {
	let hash = window.location.hash.substr(1);
	if(hash) {select(hash)};
}

document.addEventListener("DOMContentLoaded", init);

let slides = document.querySelectorAll('.item');
let currentSlide = 0;

let slideMode = false;

function switchMode() {
	let div = document.getElementById("content");
	if(!slideMode) {
		div.classList.add('slides');
	} else {
		div.classList.remove('slides');
	}
	slideMode = !slideMode;
}

function moveSlide(x) {
	slides[currentSlide].classList.remove('showing');
	slides[currentSlide].parentElement.classList.remove('showing');
	currentSlide = (currentSlide+slides.length+x)%slides.length;
	slides[currentSlide].classList.add('showing');
	slides[currentSlide].parentElement.classList.add('showing');
}

function prevSlide() {
	moveSlide(-1);
}

function nextSlide() {
    moveSlide(1);
}
