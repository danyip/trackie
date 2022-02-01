// const addSkill =  function(){
  const createButton = document.getElementById("add-skill");

  createButton.addEventListener("click", function(){
    console.log("hello");
    const lastId = document.querySelector('#fieldset-container').lastElementChild.id;
    const newId = parseInt(lastId, 10) + 1;
    const newFieldset = document.querySelector('[id="0"]').outerHTML.replace(/0/g,newId)

    document.querySelector("#fieldset-container").insertAdjacentHTML(
      "beforeend", newFieldset
    );
  })
// };

// export {addSkill}