
const easterFeature = () => {
  console.log("hello")
  const easter = document.getElementById("easteregg")
  easter.addEventListener("click", (event) => {
  if (document.querySelector("body").style.background !== "black") {
    document.querySelector("body").style.background = "black";
  } else {
    document.querySelector("body").style.background = "#F4F4F4";
  }
  });
};


export { easterFeature };
