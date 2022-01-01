/// <reference types="cypress" />

describe('Submitting a Student form', () => {
    beforeEach(() => {
        cy.visit('https://demoqa.com/automation-practice-form')
    })

    it('can enter valid values in text fields', () => {
        cy.get('#firstName').type("Andy")
        cy.get('#lastName').type("Fake")
        cy.get('#userEmail').type("andy.fake@fake.ca")
        cy.get('.custom-control.custom-radio.custom-control-inline [type="radio"]').check('Male', {force:true})
        cy.get('#userNumber').type('4441231234')
        cy.get('.custom-control.custom-checkbox.custom-control-inline [type="checkbox"]').check('2', {force:true})
        cy.get('#currentAddress').type('2 berkeley street, Toronto, ON M5A 1B2')

        cy.get('#submit').click()
        cy.get('.modal-content').should('be.visible')
    })

    it('does not accept empty values in text fields', () => {
        cy.get("#submit").click()
        cy.get('.modal-content').should('not.exist')
    })

    it('does not accept negative values in Mobile field', () => {
        cy.get('#firstName').type("Andy")
        cy.get('#lastName').type("Fake")
        cy.get('#userEmail').type("andy.fake@fake.ca")
        cy.get('.custom-control.custom-radio.custom-control-inline [type="radio"]').check('Male', {force:true})
        cy.get('#userNumber').type('-4441231234')

        cy.get('#submit').click()
        cy.get('.modal-content').should('not.exist')
    })

    it.skip('must have 10 digits for mobile field', () => {
        cy.get('#firstName').type("Andy")
        cy.get('#lastName').type("Fake")
        cy.get('#userEmail').type("andy.fake@fake.ca")
        cy.get('.custom-control.custom-radio.custom-control-inline [type="radio"]').check('Male', {force:true})
        cy.get('#userNumber').type('1234').click()

        cy.get('#submit').click()
        cy.get('.modal-content').should('not.exist')

    })

    it('must select gender radio button', () => {
        cy.get('#firstName').type("Andy")
        cy.get('#lastName').type("Fake")
        cy.get('#userEmail').type("andy.fake@fake.ca")
        cy.get('#userNumber').type('4441231234')

        cy.get('#submit').click()
        cy.get('.modal-content').should('not.exist')
    })

    it('can select multiple hobbies checkboxes', () => {
        cy.get('#firstName').type("Andy")
        cy.get('#lastName').type("Fake")
        cy.get('#userEmail').type("andy.fake@fake.ca")
        cy.get('.custom-control.custom-radio.custom-control-inline [type="radio"]').check('Male', {force:true})
        cy.get('#userNumber').type('4441231234')
        cy.get('.custom-control.custom-checkbox.custom-control-inline [type="checkbox"]').check('1', {force:true})
        cy.get('.custom-control.custom-checkbox.custom-control-inline [type="checkbox"]').check('2', {force:true})
        cy.get('.custom-control.custom-checkbox.custom-control-inline [type="checkbox"]').check('3', {force:true})
    
        cy.get('#submit').click()
        cy.get('.modal-content').should('is.visible')
        cy.contains('Sports, Reading, Music')
    })

    it('can upload a file with image extension')

    it('does not upload a file that is not an image')
})
