// ==UserScript== 
// @name         Simple Seterra Helper
// @namespace    http://tampermonkey.net/
// @license      MIT
// @version      1.0
// @description  Highlights the correct country/location in Seterra on GeoGuessr.
// @author       azzlam
// @match        https://www.geoguessr.com/*
// @icon         https://www.google.com/s2/favicons?sz=64&domain=geoguessr.com
// @grant        none
// ==/UserScript==

setInterval(() => {
    // Locate the game header where the current question is stored
    const gameHeader = document.querySelector("#__next [class^='seterra'] [class^='seterra_content'] [class^='seterra_main'] [class^='game-container'] [class^='game-container'] [class^='game-page_gameAreaWrapper'] [class^='game-area_gameWrapper'] [class^='game-header_wrapper']");
    if (gameHeader) {
        // Get the current question's ID
        const currentQuestionId = gameHeader.getAttribute('data-current-question-id')?.replace(/ /g, "_");
        // Locate the correct country/location element
        const correct = document.querySelector(`#${currentQuestionId}`);
        if (correct) {
            // Highlight the correct answer with a static color
            correct.style.setProperty("--fill-color", "rgba(0, 100, 0, 0.7)"); // Static dark green for the correct location
        }
    }
}, 500); // Check every 500 milliseconds
