/// <reference types="cypress" />

describe('Slider feature with value box', () => {
    beforeEach(() => {
        cy.visit('https://demoqa.com/slider')
    })

    const sliderValue = [
        {
            value: '0'
         },
         {
            value: '100'
         }]

    //assumes all tests are expected design features
    sliderValue.forEach((range) => {
        it(`can slide to the value ${range.value}`, () => {
            cy.get('.range-slider').invoke('val', `${range.value}`).trigger('change')
            cy.get('#sliderValue').invoke('val', `${range.value}`).trigger('change')
            cy.get('#sliderValue').should('have.value', `${range.value}`)
        })
    })
    
    //this test was added because a user should be able to enter into the enabled textbox
    it.skip('can enter value into the value box', () => {
        cy.get('#sliderValue').type('30')
        cy.get('#sliderValue').should('have.value', '30')
    })

    //this test validates the actual function as seen on site
    it('cannot enter value into the value box', () => {
        cy.get('#sliderValue').type('30')
            .should('have.value', '25')
    })

    it('can slide by using arrow keys', () => {
        cy.get('.range-slider').invoke('val', '{arrow}').trigger('change')
        cy.get('#sliderValue').should('have.value', '50')
    })
})