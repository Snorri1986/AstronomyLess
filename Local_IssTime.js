function startTime() {
    var today = new Date().toString();
    document.getElementById('LocalTime').innerHTML =
    "Місцевий час" + ": <br>" + today.slice(0,33);
    var t = setTimeout(startTime, 500);
   }

function startTimeIss()
{
    var dayIss = new Date().toUTCString();
    document.getElementById("LocalTimeISS").innerHTML = 
    "Час на МКС: <br>" + dayIss;
    var t = setTimeout(startTimeIss, 500);
}