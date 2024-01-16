// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
// importing javascript to java script
import "popper";
import "bootstrap";
document.addEventListener("turbo:load", (event) => {
  const dashboardBtn = document.querySelectorAll(".dashboard-btn");
  const dashboardView = document.getElementById('dashboard-user-data')
  async function sendRequest(url){
    const response = await fetch(url);
    const data = await response.text()
    dashboardView.innerHTML = data
  }
  function addViewToDashboard(btn){
    let url = ""
    switch(btn.dataset.bsDashboardBtn){
      case "properties":
        btn.style.background = "#33333 "
        sendRequest('/user/listings')
        return
      case "rented-property":
        sendRequest('/user/rented_properties')
        return
      case "bookings":
        sendRequest('/user/bookings')
      default:
    }
  }
  // initiallization http request response
  dashboardBtn.forEach((btn) => {
    btn.addEventListener("click", (event) => {
      console.log(btn.dataset)
      addViewToDashboard(btn)
    });
  });
});
