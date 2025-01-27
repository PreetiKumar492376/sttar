// ==UserScript== 
// @name         Discreet Seterra Helper (No Color Change on Click)
// @namespace    http://tampermonkey.net/
// @license      MIT
// @version      1.5
// @description  Subtle helper for Seterra that adjusts styles for the correct country/location without changing colors on click.
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
            // Set a static color for the correct location (no interaction-based changes)
            correct.style.setProperty("--fill-color", "rgba(0, 100, 0, 0.7)"); // Static dark green

            const correctDot = correct.querySelector("[class^='hitbox-dot']");
            if (correctDot) {
                // Set a static color for the hitbox dot (no interaction-based changes)
                correctDot.style.fill = "rgba(0, 100, 0, 0.7)"; // Match the same dark green
                correctDot.style.opacity = "1"; // Ensure it remains fully visible
            }
        }
    }
}, 500); // Adjusted interval to run less frequently
