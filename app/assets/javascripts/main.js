document.addEventListener("click", function(e){
  // console.log("click");
  const isDropdownButton = e.target.matches('.dropdown-button');
  // console.log(isDropdownButton);

  if (!isDropdownButton && e.target.closest('.dropdown') != null) {
    console.log("hello");
    return
  };

  let currentDropdown
  if (isDropdownButton) {
    currentDropdown = e.target.closest('.dropdown')
    currentDropdown.classList.toggle('active')

  }

  document.querySelectorAll(".active").forEach(dropdown => {

    if (dropdown === currentDropdown) return

    dropdown.classList.remove('active')

  })
})