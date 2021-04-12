import Swal from "sweetalert2";

const buyGame = e => {
  e.preventDefault();
  Swal.mixin({
    input: "text",
    confirmButtonText: "Next &rarr;",
    confirmButtonColor: "#5DBB9D",
    showCancelButton: true,
    progressSteps: ["1", "2", "3"]
  })
    .queue([
      {
        text: "Please enter your name"
      },
      {
        text: "Please enter your address"
      }
    ])
    .then(result => {
      if (result.value) {
        Swal.fire({
          title: `Hi, ${result.value[0]}`,
          text: `Your game will be delivered to: ${result.value[1]}`,
          type: "info",
          width: 600,
          padding: "3em",
          showCancelButton: true,
          confirmButtonColor: "#5DBB9D",
          cancelButtonColor: "#d33",
          confirmButtonText: "Confirm Purchase"
        }).then(result => {
          if (result.value) {
            Swal.fire(
              "Bought!",
              "Your game will be delivered in 2-5 business days. Please pay cash on delivery.",
              "success"
            );
          }
        });
      }
    });
};

export default buyGame;
