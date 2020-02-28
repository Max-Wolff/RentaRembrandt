const closePopup = () => {
  const bgPopup = document.getElementById('popup-bg')
  const closeIcon = document.getElementById('close-icon')
  if (bgPopup) {
    document.querySelector('body').classList.add('block-scrolling')
  }

  if (closeIcon) {
    closeIcon.addEventListener('click', () => {
      document.getElementById('popup-bg').style.display = 'none';
      document.querySelector('body').classList.remove('block-scrolling')
    });
  }
}

export {closePopup}
