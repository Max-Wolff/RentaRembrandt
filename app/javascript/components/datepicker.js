import flatpickr from 'flatpickr';

const toggleDateInputs = () => {
  const startDateInput = document.getElementById('booking_start_date');
  const endDateInput = document.getElementById('booking_end_date');
  const paintingPriceString = document.getElementById('painting-price');
  if (paintingPriceString) {
    const paintingPrice = Number(paintingPriceString.innerText.slice(0, paintingPriceString.innerText.length - 2));
  }

  if (startDateInput && endDateInput) {
    const unvailableDates = JSON.parse(document.querySelector('.widget-content').dataset.unavailable)

    flatpickr(startDateInput, {
      minDate: 'today',
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      disable: unvailableDates,
      onChange: (selectedDates, selectedDate) => {
        if (selectedDate === '') {
          endDateInput.disabled = true;
        }
        let minDate = selectedDates[0];
        minDate.setDate(minDate.getDate() + 1);
        endDateCalendar.set('minDate', minDate);
        endDateInput.disabled = false;
      }
    });
    const endDateCalendar =
      flatpickr(endDateInput, {
        dateFormat: "Y-m-d",
        disable: unvailableDates,
        onChange: (selectedDates, selectedDate) => {
          let days = Math.round((new Date(selectedDates[0]) - new Date(startDateInput.value)) / 86400000);
          const totalPaintingPrice = paintingPrice * days;
          document.getElementById('painting-price').innerText = `${totalPaintingPrice} €`;
          if (days > 1) {
            document.getElementById('calculation-price').innerText = `${days} Days`
          } else {
            document.getElementById('calculation-price').innerText = '1 Day'
          }
          document.getElementById('fee-price').innerText = `${(totalPaintingPrice * 0.05).toFixed(2)} €`;
          document.getElementById('total-price').innerText = `${(totalPaintingPrice * 1.05).toFixed(2)} €`;
        }
      },
    );
  }
};

export { toggleDateInputs }
