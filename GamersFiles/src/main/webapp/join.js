var join = document.getElementById("join")
var login = document.getElementById("login")
var inner = document.getElementById("inner")
var btnjoin = document.getElementById("btn-join")
btnjoin.addEventListener("click", e => {
	console.log('test')
	join.style.display = "flex"
	login.style.display = "none"
	inner.style.display = "none"
})
let closeJoin = join.querySelector(".close-join")
closeJoin.addEventListener("click", e => {
	join.style.display = "none"
	login.style.display = "none"
	inner.style.display = "inline"
})
join.addEventListener("click", e => {
	var evTarget = e.target
	if (evTarget.classList.contains("join-overlay")) {
		join.style.display = "none"
		login.style.display = "none"
		inner.style.display = "inline"
	}
})