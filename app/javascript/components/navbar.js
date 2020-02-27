const updateNavbarOnScroll = () => {
  const navbar = document.querySelector('#navbar-landing');

  let scrollY = 0;

  window.addEventListener('scroll', () => {
    if (window.scrollY >= (window.innerHeight / 2)) {
      navbar.classList.add('scrolled')
    } else {
      navbar.classList.remove('scrolled')
    }
  });
}


export { updateNavbarOnScroll };
