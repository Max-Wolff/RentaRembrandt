
const easterFeature = () => {
  console.log("hello")
  const easter = document.getElementById("easteregg")
  easter.addEventListener("click", (event) => {
  if (document.querySelector("body").style.background !== "rgb(90,90,90)") {
    document.querySelector("body").style.background = "rgb(90,90,90)";
  } else {
    document.querySelector("body").style.background = "#F4F4F4";
  }
  });
};


export { easterFeature };
