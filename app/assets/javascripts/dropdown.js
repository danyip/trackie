// Add an event listener to the whole page
document.addEventListener("click", function(e){
  // console.log("click");
  // Boolean for what was clicked. True if its a dropdown
  const isDropdownButton = e.target.matches('.dropdown-button');
  // console.log(isDropdownButton);

  // If the click wasn't a dropdown, but was inside of a dropdown, do nothing - exit the function
  if (!isDropdownButton && e.target.closest('.dropdown') != null) {
    // console.log("hello");
    return
  };

  // Toggle the dropdown thats clicked with the active class
  let currentDropdown
  if (isDropdownButton) {
    currentDropdown = e.target.closest('.dropdown');
    currentDropdown.classList.toggle('active');
  };

  // Close all other dropdowns so only one is open at a time
  document.querySelectorAll(".active").forEach(dropdown => {
    if (dropdown === currentDropdown) return;
    dropdown.classList.remove('active');
  })
})