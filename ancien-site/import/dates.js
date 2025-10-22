function toUTC(date) {
    return Date.UTC(
        date.getFullYear(),
        date.getMonth(),
        date.getDate()
    );
}

function displayDates() {
    var currentDate = toUTC(new Date());

    var divs = document.getElementsByClassName("dyndate");
	for (var d = 0; d < divs.length; d++) {

		var children = divs[d].childNodes;
		var start = "";
		var end = "";
		for (var i=0 ; i<children.length; i++) {
			if (children[i].nodeType == 1) {
				if (children[i].classList.contains("start")) {
					start = children[i];
				}
				if (children[i].classList.contains("end")){
					end = children[i];
				}
			}
		}

		var show = true;
		if (start != "") {
			var startDate = new Date(start.innerHTML);
			if (currentDate < startDate) {
				show = false;
			}
		}
		if (end != "") {
			var endDate = new Date(end.innerHTML);
			if (currentDate > endDate) {
				show=false;
			}
		}

		if (show) {
			divs[d].classList.remove("d-none");
		}
		else {
			divs[d].classList.add("d-none");
		}
	}
}