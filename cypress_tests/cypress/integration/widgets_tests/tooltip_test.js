/// <reference types="cypress" />

describe('Tooltips on hover', () => {
    before(() => {
        cy.visit('https://demoqa.com/tool-tips')
    })

    const Tooltips = [
        {
            element: 'button',
            elementname: '#toolTipButton',
            attribute: 'buttonToolTip'
        },
        {
            element: 'text field',
            elementname: '#toolTipTextField',
            attribute: 'textFieldToolTip'
        },
        {
            element: 'text',
            elementname: '#data-cy-test',   //SOLUTION: should add data-attributes on <a> element to find tooltip
            attribute: 'contraryTexToolTip'
        }]

    Tooltips.forEach((element) => {
        it(`tooltip on ${element.element} hover`, () => {
            cy.get(`${element.elementname}`).trigger('mouseover', { force:true})
                .should('have.attr', 'aria-describedby', `${element.attribute}` )
        })
    })
})