const closePopup = () => {
  const bgPopup = document.getElementById('popup-bg')
  const closeIcon = document.getElementById('close-icon')
  if (closeIcon) {
    closeIcon.addEventListener('click', () => {
      document.getElementById('popup-bg').style.display = 'none';
    });
  }
}

export {closePopup}
