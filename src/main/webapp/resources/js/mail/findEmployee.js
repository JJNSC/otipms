var dropdown1 = document.getElementById("dropdown1");

dropdown1.querySelector("select").addEventListener("change", function(event) {
  const selectedOption = event.target.value;
  if (selectedOption) {
    const newDropdown = document.createElement("div");
    newDropdown.className = "dropdown";
    newDropdown.innerHTML = `
      <select>
        <option value="" disabled selected>Select an option</option>
        <option value="sub-option1">Sub-Option 1</option>
        <option value="sub-option2">Sub-Option 2</option>
        <option value="sub-option3">Sub-Option 3</option>
      </select>
    `;
    dropdown1.appendChild(newDropdown);
  }
});