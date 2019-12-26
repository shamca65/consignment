module TableTools
# traverse json from the root to pick out item IDs to update
  def extract_ids(params)
    selected_ids = []
    params[$json_root].each do |k|
      k.each do |l, m|
        if l == $json_id_field
          if m.present?
            selected_ids.push(m.to_i)
          end
        end
      end
    end
    selected_ids
  end

  def get_order_no
    # get the current hour and return it
    dt = Date.today
    day = '%02d' % dt.day
    mon = '%02d' % dt.month
    yr = '%02d' % dt.year
    #
    t = Time.now
    hr = '%02d' % t.hour
    min = '%02d' % t.min
    sec = '%02d' % t.sec
    #
    ord_no = day+mon+yr+hr+min+sec
    ord_no.to_i
  end
end