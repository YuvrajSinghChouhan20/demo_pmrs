// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// importing javascript to java script
import "popper"
import "bootstrap"

const dashboardBtn = document.querySelectorAll('.dashboard-btn');
const listings = document.getElementById('listings');
const dashboard = document.getElementById('dashboard');

console.log(dashboardBtn)

const applyListings = (btn)=>{
  if(btn.clicked)
    btn.style.background = "#f8f9fa"

  if (btn.dataset.bsProperties){
    listings.style.display = "block"
    dashboard.style.display = "none"
  }
  else{
    listings.style.display = "none"
    dashboard.style.display = "block"
  }
}

dashboardBtn.forEach(btn => {
  console.log(btn)
  btn.addEventListener('click', (event)=>{applyListings(btn)})
});

