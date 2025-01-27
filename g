// ==UserScript==
// @name         Discreet Seterra Helper
// @namespace    http://tampermonkey.net/
// @license      MIT
// @version      1.4
// @description  Subtle helper for Seterra that adjusts styles for the correct country/location using a darker green color.
// @author       azzlam
// @match        https://www.geoguessr.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=geoguessr.com
// @grant        none
// ==/UserScript==

setInterval(() => {
    const gameHeader = document.querySelector("#__next [class^='seterra'] [class^='seterra_content'] [class^='seterra_main'] [class^='game-container'] [class^='game-container'] [class^='game-page_gameAreaWrapper'] [class^='game-area_gameWrapper'] [class^='game-header_wrapper']");
    if (gameHeader) {
        const currentQuestionId = gameHeader.getAttribute('data-current-question-id')?.replace(/ /g, "_");
        const correct = document.querySelector(`#${currentQuestionId}`);
        if (correct) {
            correct.addEventListener('click', () => {
                correct.style.setProperty("--fill-color", "rgba(0, 100, 0, 0.5)"); // Subtle dark green
            });
            correct.style.setProperty("--fill-color", "rgba(0, 100, 0, 0.7)"); // Slightly darker green when unclicked

            const correctDot = correct.querySelector("[class^='hitbox-dot']");
            if (correctDot) {
                correctDot.addEventListener('click', () => {
                    correctDot.style.opacity = "0.5"; // Make the dot less visible instead of removing it
                });
                correctDot.style.fill = "rgba(0, 100, 0, 0.7)"; // Match the darker green
            }
        }
    }
}, 500); // Adjusted interval to run less frequently
