const bannerCarousel = () => {
  let slideIndex = 0;
  const bannerPictures = document.querySelectorAll(".banner-picture");

  const changeBanner = () => {
    if (slideIndex >= bannerPictures.length) {slideIndex = 0}
    if (slideIndex < 0) {slideIndex = bannerPictures.length} ;
    for (let i = 0; i < bannerPictures.length; i++) {
      bannerPictures[i].classList.add('hidden');
    }
    bannerPictures[slideIndex].classList.remove('hidden');

    slideIndex ++
    console.log(slideIndex)
  }

  setInterval(function() {
    changeBanner()
  }, 4000);
}

export { bannerCarousel };
