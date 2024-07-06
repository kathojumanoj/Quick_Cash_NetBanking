function display_c(){
    mytime=setTimeout('display_ct()',1000)
}

function display_ct() {
    var x = new Date();
    var xx=x.toLocaleTimeString();
    var yy=x.toLocaleDateString();
    document.getElementById('ct').innerHTML = yy+" "+xx+" ";
    display_c();
}
var x=document.getElementById('login');
var y=document.getElementById('reges');
var z=document.getElementById('btn');
function reg() {
  // body...
  x.style.left="-400px";
  y.style.left="50px";
  z.style.left="100px";
}
function login() {
  // body...
  x.style.left="50px";
  y.style.left="450px";
  z.style.left="0px";
}
function  valid() {
  // body...
  let p=document.myform.uname.value;
  if(p=="")
  {
      alert("Name not empty");
return 0;
  }
}