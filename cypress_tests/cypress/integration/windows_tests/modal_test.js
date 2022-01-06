/// <reference types="cypress" />

describe('Click button to view modal', () => {
    beforeEach(() => {
        cy.visit('https://demoqa.com/modal-dialogs')
    })

    const modalSize = [{
        size: '#showSmallModal',
        text: 'Small Modal',
        closebutton: '#closeSmallModal',
        closetext: 'close'
    },
    {   
        size: '#showLargeModal',
        text: 'Large Modal',
        closebutton: '#closeLargeModal',
        closetext: 'close'
    },
    {   
        size: '#showSmallModal',
        text: 'Small Modal',
        closebutton: '.close',
        closetext: 'X'
    }]

    modalSize.forEach((size) => {
        it(`clicks button to open ${size.text} and ${size.closetext}`, () => {
            cy.get(`${size.size}`).click()
            cy.get('.modal-header').should('be.visible')
                .and('contain', `${size.text}`) 
            cy.get(`${size.closebutton}`).click()
            cy.get('.modal-header').should('not.exist')
        })
    })
})
