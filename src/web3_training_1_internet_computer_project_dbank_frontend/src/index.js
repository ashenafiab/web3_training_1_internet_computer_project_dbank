import { web3_training_1_internet_computer_project_dbank_backend } from "../../declarations/web3_training_1_internet_computer_project_dbank_backend";

window.addEventListener('load', async () => {
  // console.log('window loaded');

 await updateBalance();

});

document.querySelector("form").addEventListener("submit", async (event) => {
  event.preventDefault();
  // console.log("Submitted");

  const button = event.target.querySelector("#submit-btn");

  const inputAmount = parseFloat(document.getElementById("input-amount").value);
  const withdrawalAmount = parseFloat(document.getElementById("withdrawal-amount").value);

  button.setAttribute("disabled", true);

  if (document.getElementById("input-amount").value.length != 0) {
    await web3_training_1_internet_computer_project_dbank_backend.deposit(inputAmount);
  }
  if (document.getElementById("withdrawal-amount").value.length != 0) {
    await web3_training_1_internet_computer_project_dbank_backend.withdraw(withdrawalAmount);
  }

  await web3_training_1_internet_computer_project_dbank_backend.compoundInterest();

  await updateBalance();

  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";
  button.removeAttribute("disabled");
});

async function updateBalance() {
  const currentAmount = await web3_training_1_internet_computer_project_dbank_backend.get();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
}
