var highlightTopicWords = function highlightTopicWords(e){
    let selector_id = e.target.id;
	let topic_name = selector_id.slice(0, selector_id.indexOf('-'));
	
	//unhighlight all topic words
	let highlighted = document.getElementsByClassName('topic-word-highlighted');
	for (var i = 0; i < highlighted.length; i++){
		highlighted[i].classList.remove('topic-word-highlighted');
	}
	
	//highlight words matching this topic
	let to_highlight = document.getElementsByClassName('topic-word-' + topic_name);
	for (var i = 0; i < to_highlight.length; i++){
		to_highlight[i].classList.add('topic-word-highlighted');
	}
};

var highlightDevices = function highlightDevices(e){
	let selector_id = e.target.id;
	let device_name = selector_id.slice(0, selector_id.indexOf('-'));
	
	//unhighlight all rhetorical devices
	let highlighted = document.getElementsByClassName('device-highlighted');
	for (var i = 0; i < highlighted.length; i++){
		highlighted[i].classList.remove('device-highlighted');
	}
	
	//highlight words matching this topic
	let to_highlight = document.getElementsByClassName('device-' + device_name);
	for (var i = 0; i < to_highlight.length; i++){
		to_highlight[i].classList.add('device-highlighted');
	}
}

window.onload = function(){
    var topic_buttons = document.getElementsByClassName('topic-selector');
	for (var i = 0; i < topic_buttons.length; i++){
		let button = topic_buttons[i];
		button.onclick = (e) => { return highlightTopicWords(e); };
	}
	
	var device_buttons = document.getElementsByClassName('device-selector');
	for (var i = 0; i < device_buttons.length; i++){
		let button = device_buttons[i];
		button.onclick = (e) => { return highlightDevices(e); };
	}
}