/// <reference types="cypress" />

describe('Enabled and disabled Tabs', () => {
    before(() => {
        cy.visit('https://demoqa.com/tabs')
        cy.get('#demo-tab-use').click()
    })

    const tabNames = [
            {
                name: 'what',
                content: 'Lorem Ipsum is simply dummy text'
            },
            {
                name: 'origin',
                content: 'Contrary to popular belief'
            },
            {
                name: 'use',
                content: 'It is a long established fact'
            }]

    tabNames.forEach((name) => {
        it(`clicks the ${name.name} tab`, () => {
            cy.get(`#demo-tab-${name.name}`).click()
                .should('have.class', 'nav-item nav-link active')
            cy.get(`#demo-tabpane-${name.name}`).should('contain', `${name.content}`)    
            })
        })
    
    it('More is not clickable', () => {
        cy.get('#demo-tab-more').should('have.class', 'nav-item nav-link disabled')
    })
})