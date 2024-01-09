// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// importing javascript to java script
import "popper"
import "bootstrap"



const dashboardBtn = document.querySelectorAll('.dashboard-btn');
const listings = document.getElementById('listings');
const bookingsList = document.getElementById('bookings');
const dashboard = document.getElementById('dashboard');
const notifications = document.getElementById('');
const rentedProperty = document.getElementById('rented-property');

const switchDisplay =(dLiting, dBookings, dRented, dNotifications, dDashboard ='block' )=>{
  listings.style.display = dLiting;
  dashboard.style.display= dDashboard;
  bookingsList.style.display= dBookings;
  rentedProperty.style.display= dRented
}
const applyListings = (btn)=>{
  if(btn.clicked)
    btn.style.background = "#f8f9fa";

  switch (btn.dataset.bsDashboardBtn) {
    case "properties":
      switchDisplay('block', 'none', 'none', 'none', "none");
      break;
    case "bookings":
      switchDisplay('none', 'block' ,'none', 'none', 'none');
      break;
    case "dashboard":
      switchDisplay('none', 'none' ,'none', 'none');
      break;
    case "rented-property":
      switchDisplay('none', 'none' ,'block', 'none', 'none');
      break;
    default:
      dashboard.style.display="block";
      break;
  }
};

dashboardBtn.forEach(btn => {
  btn.addEventListener('click', (event)=>{applyListings(btn)});
});

