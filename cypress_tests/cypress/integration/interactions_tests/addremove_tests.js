/// <reference types="cypress" />

Cypress.Commands.add('addMultipleElements', () => {
        for(let n = 0; n < 5; n ++) {
            cy.get('[onclick="addElement()"]').click()
        }
    })
    
describe('Adding elements to the page', () => {
    beforeEach(() => {
        cy.visit('https://the-internet.herokuapp.com/add_remove_elements/')
    })

    it('can add an element on the page', () => {
        cy.get('[onclick="addElement()"]').click()
        cy.get('.added-manually').should('be.visible')
    })

    it('can add multiple elements on the page', () => {
        cy.addMultipleElements()
        cy.get('.added-manually').should('be.visible')
            .and('have.length', 5)
    })
})

describe('Removing elements from the page', () => {
    it('can remove last element on the page', () => {
        cy.addMultipleElements()
        cy.get('[onclick="deleteElement()"]').click({multiple: true})
        cy.get('.added-manually').should('not.exist')
    })

    it('can remove one element on the page', () => {
        cy.addMultipleElements()
        cy.get('#elements > :nth-child(4)').click()
        cy.get('.added-manually').should('be.visible')
            .and('have.length', 4)
    })
})

describe('Remove elements with dynamic controls', () => {
    beforeEach(() => {
        cy.visit('https://the-internet.herokuapp.com/dynamic_controls')
    })

    it('can remove checkbox unchecked', () => {
        cy.get('[onclick="swapCheckbox()"]').click().should('have.text', 'Remove')
        cy.get('#message').should('be.visible')
            .and('have.text', `It's gone!`)
    })

    it('can add checkbox back, check it, and hide it', () => {
        cy.get('[onclick="swapCheckbox()"]').click().should('have.text', 'Remove')
        cy.get('[onclick="swapCheckbox()"]').click().should('have.text', 'Add')
        cy.get('#message').should('be.visible')
            .and('have.text', `It's back!`)
        cy.get('#checkbox').should('be.visible').check()
        cy.get('[onclick="swapCheckbox()"]').click().should('have.text', 'Remove')
        cy.get('#message').should('be.visible')
            .and('have.text', `It's gone!`)
        cy.get('#checkbox-example > button').should('have.text', 'Add')
    })

})