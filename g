// ==UserScript==
// @name         Seterra Helper (Dark Green Version)
// @namespace    http://tampermonkey.net/
// @license      MIT
// @version      1.3
// @description  Highlights the correct country/location in dark green, then lighter green when clicked.
// @author       azzlam
// @match        https://www.geoguessr.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=geoguessr.com
// @grant        none
// @downloadURL  https://update.greasyfork.org/scripts/474936/Seterra%20Helper%20(Dark%20Green).user.js
// @updateURL    https://update.greasyfork.org/scripts/474936/Seterra%20Helper%20(Dark%20Green).meta.js
// ==/UserScript==

setInterval(() => {
    const gameHeader = document.querySelector("#__next [class^='seterra'] [class^='seterra_content'] [class^='seterra_main'] [class^='game-container'] [class^='game-container'] [class^='game-page_gameAreaWrapper'] [class^='game-area_gameWrapper'] [class^='game-header_wrapper']");
    if (gameHeader) {
        const currentQuestionId = gameHeader.getAttribute('data-current-question-id')?.replace(/ /g, "_");
        const correct = document.querySelector("#".concat(currentQuestionId));
        if (correct) {
            // On click, change the color to a lighter green
            correct.addEventListener('click', function () {
                correct.style.setProperty("--fill-color", "rgba(0, 100, 0, 0.5)");
            });
            // Default color is dark green
            correct.style.setProperty("--fill-color", "rgba(0, 100, 0, 0.7)");

            const correctDot = correct.querySelector("[class^='hitbox-dot']");
            if (correctDot) {
                // Remove the dot on click
                correctDot.addEventListener('click', function () {
                    correctDot.style.display = "none";
                });
                // Default color for the dot is dark green
                correctDot.style.fill = "rgba(0, 100, 0, 0.7)";
            }
        } else {
            console.log("Current question ID not found");
        }
    } else {
        console.log("Game element not found");
    }
}, 150);
