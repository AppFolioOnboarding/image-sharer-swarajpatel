/* eslint-env mocha */

import assert from 'assert';
import { shallow } from 'enzyme';
import React from 'react';
import sinon from 'sinon';
import Form from '../../components/Form';
import * as api from '../../utils/helper';

describe('<Form />', () => {
  afterEach(() => {
    sinon.restore();
  });
  it('should render correctly', () => {
    const wrapper = shallow(<Form />);
    const form = wrapper.find('form');
    assert.strictEqual(form.length, 1);

    const labels = form.find('label');
    assert.strictEqual(labels.length, 2);
    assert.strictEqual(labels.at(0).text(), 'Your Name:');
    assert.strictEqual(labels.at(1).text(), 'Comments:');

    const fields = form.find('input');
    assert.strictEqual(fields.length, 3);

    assert.strictEqual(fields.at(0).prop('name'), 'name');
    assert.strictEqual(fields.at(1).prop('name'), 'comments');
    assert.strictEqual(fields.at(2).prop('type'), 'submit');

    assert.strictEqual(fields.at(0).text(), '');
    assert.strictEqual(fields.at(1).text(), '');
    assert.strictEqual(fields.at(2).prop('value'), 'Submit');
  });

  it('should capture name corrrectly onChange', () => {
    const wrapper = shallow(<Form />);
    const input = wrapper.find('input').at(0);
    const event = { target: { value: 'test input' } };
    input.simulate('change', event);
    assert.strictEqual(wrapper.state().name, 'test input');
  });

  it('should capture comment correctly onChange', () => {
    const wrapper = shallow(<Form />);
    const input = wrapper.find('input').at(1);
    const event = { target: { value: 'test input' } };
    input.simulate('change', event);
    assert.strictEqual(wrapper.state().comment, 'test input');
  });

  it('should call formSubmitHandler when button is clicked', () => {
    const wrapper = shallow(<Form />);
    const formSubmitHandlerStub = sinon.stub(wrapper.instance(), 'formSubmitHandler');

    wrapper.find('input').at(2).simulate('click');

    assert(formSubmitHandlerStub.called);
  });

  it('should show success message when submit passes', () => {
    const formComponent = shallow(<Form />);
    sinon.stub(api, 'post').resolves({ message: 'Successfully submitted your feedback' });

    return formComponent.instance().formSubmitHandler().then(() => {
      const messageDiv = formComponent.find('div#message');
      assert.strictEqual(messageDiv.text(), 'Successfully submitted your feedback');
    });
  });

  it('should show failure message when submit fails', () => {
    const formComponent = shallow(<Form />);
    sinon.stub(api, 'post').rejects({ data: { error: 'Something went wrong, try again' } });

    return formComponent.instance().formSubmitHandler().then(() => {
      const messageDiv = formComponent.find('div#message');
      assert.strictEqual(messageDiv.text(), 'Something went wrong, try again');
    });
  });
});
