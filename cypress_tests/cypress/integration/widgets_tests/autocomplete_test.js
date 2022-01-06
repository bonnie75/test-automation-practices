/// <reference types="cypress" />
Cypress.Commands.add('addMultipleColor', (colour) => {
    cy.get('#autoCompleteMultipleInput').type(colour.letter)
  })

describe('Tests for multiple colour names widget test', () => {
    beforeEach(() => {
        cy.visit('https://demoqa.com/auto-complete')
    })

    const colourSelection = [
        {
            letter: 'b',
            name: 'Blue'
         },
         {
            letter: 'bla',
            name: 'Black'
         },
         {
            letter: 'In',
            name: 'Indigo'
         },
         {
            letter: "G",
            name: 'Green'
         },
         {
            letter: 'p',
            name: 'Purple'
         },
         {
            letter: 'r',
            name: 'Red'
         },
         {
            letter: 'Y',
            name: 'Yellow'
         }]

    it('can type multiple colour names', () => {
        colourSelection.forEach((colour) => {
            cy.addMultipleColor({ letter: `${colour.letter}{enter}`, name: `${colour.name}` })
            cy.get('.css-1rhbuit-multiValue.auto-complete__multi-value').should('contain', (colour.name))
        })
    })

    it('can remove one colour from multiple list', () => {
        colourSelection.forEach((colour) => {
            cy.addMultipleColor({ letter: `${colour.letter}{enter}`, name: `${colour.name}` })
        })
        cy.get(':nth-child(3) > .css-xb97g8 > .css-19bqh2r > path').click()
        cy.get('.css-1rhbuit-multiValue.auto-complete__multi-value').should('not.contain', 'Indigo')
    })

    it('can clear multiple colours', () => {
        colourSelection.forEach((colour) => {
            cy.addMultipleColor({ letter: `${colour.letter}{enter}`, name: `${colour.name}` })
        })
        cy.get('.auto-complete__indicator > .css-19bqh2r > path').click()
        cy.get('#autoCompleteMultipleInput').should('be.empty')
    })

    it('can not enter colour that does not exist in Multiple field', () => {
        cy.get('#autoCompleteMultipleInput').type('Orange{enter}')
        cy.get('.css-1rhbuit-multiValue.auto-complete__multi-value').should('not.exist')
    })
})


describe('Tests for single colour name widget test', () => {
    beforeEach(() => {
        cy.visit('https://demoqa.com/auto-complete')
    })

    it('can type single colour name', () => {
        cy.get('#autoCompleteSingleInput').type('bl{enter}')
        cy.get('.auto-complete__single-value.css-1uccc91-singleValue').should('be.visible')
            .should('contain', 'Blue')
    })

    it('can not type multiple colours in single', () => {
        cy.get('#autoCompleteSingleInput').type('bl{enter}')
        cy.get('#autoCompleteSingleInput').type('y{enter}')
        cy.get('.auto-complete__single-value.css-1uccc91-singleValue').should('be.visible')
            .should('contain', 'Yellow')
            .and('not.contain', 'Blue')
    })

    it('can not clear from single field', () => {
        cy.get('#autoCompleteSingleInput').type('bl{enter}').focus().type('{backspace}{del}')
        cy.get('.auto-complete__single-value.css-1uccc91-singleValue').should('be.visible')
            .should('contain', 'Blue')
    
    })

    it('can not enter colour that does not exist in single field', () => {
        cy.get('#autoCompleteSingleInput').type('Orange{enter}')
        cy.get('#autoCompleteMultipleInput').focus()
        cy.get('#autoCompleteSingleInput').should('be.empty')
    })
})